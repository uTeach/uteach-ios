# !/bin/sh

# GITHUB_TOKEN='01387c4e8276bf9f7ca52ae3c630a6a88f9c7220'
# export PLATFORM="ios"
#
# BUILD_NUMBER=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$PWD/uteach/info.plist")
# export APP_IDENTIFIER="com.uteachapp.UTeach"
#
# git clone "https://${GITHUB_TOKEN}@github.com/mercadolibre/mobile-cd.git" --branch sl-bitcode  --single-branch
# cd mobile-cd
#
# echo "Is $BUILD_NUMBER the build number ? (y/n)"
#
# read IS_BUILD_NUMBER
#
# if [[ $IS_BUILD_NUMBER == n ]]; then
#   echo "Enter your real build number: "
#   read BUILD_NUMBER
# fi
#
# export BUILD_NUMBER
#
# bundle update
# fastlane $PLATFORM get_dsyms
#
# mv com.uteachapp.UTeach-1.0-1.dSYM.zip ../
# cd ../
#

for file in $(find . -regex ".*\.dSYM");do
  echo $file
done

# curl https://upload.bugsnag.com/ -F dsym=@MyApp.app.dSYM/Contents/Resources/DWARF/MyApp

# echo "Deleting mobile-cd"
# rm -rf ../mobile-cd
