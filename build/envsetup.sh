function __print_fortune_functions_help() {
cat <<EOF
Additional functions:
- mka:             Builds using all available CPUs
- brunch:          Lunch + mka in one command
- clomerge:        Utility to merge CLO tags.
- getfortune:      Lunch + mka in one command
- sort-blobs-list: Sort proprietary-files.txt sections with LC_ALL=C.
EOF
}

# Make using all available CPUs
function mka() {
    m "$@"
}

function brunch()
{
    lunch $1-userdebug
    if [ $? -eq 0 ]; then
        time m fortune
    else
        echo "Lunch failed!"
        return 1
    fi
    return $?
}

function getfortune()
{
    source build/envsetup.sh
    lunch fortune_$1
    if [ $? -eq 0 ]; then
        time mka fortune
    else
        echo "Lunch failed!"
        return 1
    fi
    return $?
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/fortune/build/tools/merge-clo.py $target_branch
}

function sort-blobs-list() {
    T=$(gettop)
    $T/tools/extract-utils/sort-blobs-list.py $@
}

export SKIP_ABI_CHECKS="true"

if [ -z ${CCACHE_EXEC} ]; then
    ccache_path=$(which ccache)
    if [ ! -z "$ccache_path" ]; then
	export USE_CCACHE=1
        export CCACHE_EXEC="$ccache_path"
        if [ -z ${CCACHE_DIR} ]; then
            export CCACHE_DIR=${HOME}/.ccache
        fi
        $ccache_path -o compression=true
	echo -e "\e[1mccache enabled and \e[32m\e[4mCCACHE_EXEC\e[0m \e[1mhas been set to : \e[4m$ccache_path\e[0m"
    else
        echo -e "\e[31m\e[1mccache not found/installed!\e[0m"
    fi
fi
