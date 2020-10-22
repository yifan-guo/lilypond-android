
HEAD='\033[1;36m'
NC='\033[0m'

mkdir -p ./app/cache
cd ./app/cache


echo -e "${HEAD}* Deploying Nodejs-mobile prebuilt binary files.${NC}"

wget -c https://github.com/JaneaSystems/nodejs-mobile/releases/download/nodejs-mobile-v0.3.1/nodejs-mobile-v0.3.1-android.zip
unzip ./nodejs-mobile-v0.3.1-android.zip -d ./libnode
rm -rf ../demo/libnode
mv ./libnode ../demo


echo -e "${HEAD}* Done.${NC}"
