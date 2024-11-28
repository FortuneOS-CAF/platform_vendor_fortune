#!/bin/bash
# CLO tag merge script for FortuneOS
# Author: Adithya R (ghostrider-reborn)
# Modified by Kizziama for FortuneOS
#
# Usage (from source root):
#    ./vendor/fortune/merge-tag.sh <TAG>

# Colors
red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
end=$'\e[0m'

REMOTE="fortune"
BRANCH="vic"

BLACKLIST="device/qcom/common"

# verify tag
if [ -z "$1" ]; then
    echo -e "Unspecified tag!\nUsage: ./vendor/fortune/build/tools/merge-tag.sh <TAG>"
    exit 1
else
    TAG="$1"
fi

if [[ $TAG = "LA.QSSI"* ]]; then
    IS_QSSI=true
    MANIFEST_URL="https://git.codelinaro.org/clo/la/la/system/manifest/-/raw/release/$TAG.xml"
    MANIFEST_XML="manifest/system.xml"
else
    IS_QSSI=false
    MANIFEST_URL="https://git.codelinaro.org/clo/la/la/vendor/manifest/-/raw/release/$TAG.xml"
    MANIFEST_XML="manifest/vendor.xml"
fi

if ! wget -q --spider $MANIFEST_URL; then
    echo "Invalid tag: $TAG!"
    exit 1
fi

# fetch all existing repos
echo "${blu}Fetching list of repos to be merged...$end"
REPOS=$(repo forall -v -c "if [ \"\$REPO_REMOTE\" = \"$REMOTE\" ]; then echo \$REPO_PATH; fi")
echo $REPOS

# save root dir
src_root=$(pwd)

# initialize some files
for file in failed success unchanged; do
    rm -f $file
    touch $file
done

# main
for repo in $REPOS; do echo;
    if [[ $BLACKLIST =~ $repo ]]; then
        echo -e "$repo is in blacklist, skipped"
        continue
    fi

    if ! grep -q -e "path=\"$repo\"" -e "name=\"$repo\"" $MANIFEST_XML; then
        echo "${red}$repo not found in CLO manifest, skipping..."
        continue
    fi

    # this is where the fun begins
    echo "${blu}Merging ${repo}..."
    name=$(grep "path=\"$repo\"" $MANIFEST_XML | sed -e 's/.*name="//' -e 's/".*//')
    if [[ -z $name ]]; then
        name=$(grep "name=\"$repo\"" $MANIFEST_XML | sed -e 's/.*name="//' -e 's/".*//')
    fi

    cd $repo
    git checkout -q $BRANCH &> /dev/null || echo "${red}$repo checkout failed!"
    if $(git rev-parse --is-shallow-repository); then
    	git fetch --unshallow $REMOTE $BRANCH
    fi

    if ! git fetch -q https://git.codelinaro.org/clo/la/$name $TAG &> /dev/null; then
        echo "${red}$repo fetch failed!"
    else
        if ! git merge FETCH_HEAD -q --no-edit &> /dev/null; then
            echo "$repo" >> $src_root/failed
            echo "${red}$repo merge failed!"
        else
            if [[ $(git rev-parse HEAD) != $(git rev-parse $REMOTE/$BRANCH) ]] && [[ $(git diff HEAD $REMOTE/$BRANCH) ]]; then
                echo "$repo" >> $src_root/success
                echo "${grn}$repo merged succesfully!"
            else
                echo "${end}$repo unchanged"
                echo "$repo" >> $src_root/unchanged
                git reset --hard $REMOTE/$BRANCH &> /dev/null
            fi
        fi
    fi

    cd $src_root
done

# update manifest
echo -e "${blu}\nUpdating manifest..."
if curl -Ls $MANIFEST_URL > $MANIFEST_XML; then
    $IS_QSSI || sed -i '3,11d' $MANIFEST_XML
    if git -C manifest commit -aq -m "manifest: update to $TAG" &> /dev/null; then
        echo -e "${blu}Manifest updated succesfully!"
        echo manifest >> success
    else
        echo -e "${red}Manifest already up to date!"
    fi
else
    echo -e "${red}Manifest update failed!"
    echo manifest >> failed
fi

# update clo rev in vendor
if $IS_QSSI; then
    echo -e "\n${blu}Updating CLO revision in vendor/fortune..."
    sed -i "s|CLO_REVISION := .*|CLO_REVISION := $TAG|g" vendor/fortune/config/version.mk
    if git -C vendor/fortune commit -aq -m "fortune: version: update CLO revision to $TAG" &> /dev/null; then
        echo -e "${blu}CLO revision updated succesfully!"
        echo vendor/fortune >> success
    else
        echo -e "${red}CLO revision already up to date!"
    fi
fi

if [ -s success ]; then
    echo -e "${grn}\nPushing succeeded repos:$end"
    for repo in $(cat success); do
        cd $repo
        echo $repo
        git push -q &> /dev/null || echo "${red}$repo push failed!"
        cd $src_root
    done
fi

if [ -s failed ]; then
    echo -e "$red \nThese repos failed merging:$end"
    cat failed
fi

echo $end
