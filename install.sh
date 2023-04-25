#!/bin/bash
set -e

echo "|------------------------------------------------------|"
echo "|                                                      |"
echo "|                  StreamEase                          |" 
echo "|                                                      |"
echo "|                                                      |"
echo "|------------------------------------------------------|"
echo ""
echo "|------------------------------------------------------|"
echo "|                     当前配置如下                     |"
echo "|------------------------------------------------------|"
cat ./docker-compose-default.env
echo "|------------------------------------------------------|"
echo ""
echo "确认信息，并继续执行？（是：y，否：n）："
read CONFIRM
YES=y
if [[ "${CONFIRM}" == "${YES}" ]]; then
	echo ""
else
	echo "取消并退出"
	exit
fi

echo ""
echo "开始创建目录 ......"
. ./docker-compose-default.env
if [[ ! -d ${MEDIA_PATH} ]]; then
	sudo mkdir -p ${MEDIA_PATH}
	echo "✅  创建目录成功：${MEDIA_PATH}"
fi
if [[ ! -d ${MEDIA_PATH}/movie ]]; then
	sudo mkdir ${MEDIA_PATH}/movie
	echo "✅  创建目录成功：${MEDIA_PATH}/movie"
fi
if [[ ! -d ${MEDIA_PATH}/serial ]]; then
	sudo mkdir ${MEDIA_PATH}/serial
	echo "✅  创建目录成功：${MEDIA_PATH}/serial"
fi
if [[ ! -d ${MEDIA_PATH}/anime ]]; then
	sudo mkdir ${MEDIA_PATH}/anime
	echo "✅  创建目录成功：${MEDIA_PATH}/anime"
fi
if [[ ! -d ${MEDIA_PATH}/download ]]; then
	sudo mkdir ${MEDIA_PATH}/download
	echo "✅  创建目录成功：${MEDIA_PATH}/download"
fi
echo "✅  创建目录成功"

echo ""
echo "修改目录权限 ......"
sudo chown -R ${USERNAME}:${GROUPNAME} ${MEDIA_PATH}
sudo chmod -R 770 ${MEDIA_PATH}
echo "✅  修改媒体目录权限成功"

echo "|"
echo "|------------------------------------------------------|"
echo "|                     当前目录结构                     |"
echo "|------------------------------------------------------|"
ls -l ${MEDIA_PATH}
echo "|------------------------------------------------------|"

echo ""
echo "生成环境变量 ......"
sudo cp ./docker-compose-default.env ./.env
echo "✅  生成环境变量成功"

echo ""
echo "修改目录权限 ......"
sudo chown -R ${USERNAME}:${GROUPNAME} ../Daisy
sudo chmod -R 770 ../Daisy
echo "✅  修改 Daisy 目录权限成功"


echo "✅  程序执行完毕 ✅"
