#!/bin/bash
# shellcheck enable=avoid-nullary-conditions

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

file_path=$1
if [[ -f $file_path ]]; then
    echo "Generating .json"
    file_name=$(basename "$file_path")
    device_name=$(echo $TARGET_PRODUCT | sed 's/fortune_//g')
    buildprop=${OUT_DIR:-out}/target/product/$device_name/system/build.prop
    if [[ $file_name == *"COMMUNITY"* ]]; then # only generate for official builds
        file_size=$(stat -c %s "$file_path")
        sha256=`sha256sum "$file_path" | cut -f 1 -d " "`
        datetime=$(grep -w ro\\.build\\.date\\.utc "$buildprop" | cut -d= -f2)
        link=https://sourceforge.net/projects/fortuneos/files/$device_name/$file_name/download
        cat >"$file_path".json <<JSON
{
  "response": [
    {
      "datetime": $datetime,
      "filename": "$file_name",
      "id": "$sha256",
      "romtype": "COMMUNITY",
      "size": $file_size,
      "url": "$link",
      "version": "1.0"
    }
  ]
}
JSON
        mv "$file_path.json" "./${device_name}.json"
        echo -e "${GREEN}Done generating ${YELLOW}$device_name.json${NC}"
    else
        echo -e "${YELLOW}Skipped generating json for a non-official build${NC}"
    fi
fi
