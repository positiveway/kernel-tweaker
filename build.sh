#!/usr/bin/env bash
clog=$(<changelog.txt)
function push() {
# shellcheck disable=SC2154
curl -F document="@$1" "https://api.telegram.org/bot${token}/sendDocument" \
     -F chat_id="${chat_id}"  \
     -F "disable_web_page_preview=true" \
     -F "parse_mode=html" \
     -F caption="${clog}"
}
echo ""
rm -rf ./*.zip
zip -r9 "YAKT-v708.zip" . -x "*build*" "*changelog*" "*.bak*" "*.git*" "*.zip" ".idea*" "test_*"
#push "YAKT-v708.zip"
