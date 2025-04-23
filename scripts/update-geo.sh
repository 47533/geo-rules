#!/bin/bash

# 设置工作目录
cd rules

# 确保 v2ray-geosite.py 存在
if [ ! -f "v2ray-geosite.py" ]; then
    echo "错误：v2ray-geosite.py 未找到！"
    exit 1
fi

# 下载 geosite.dat
wget https://ghproxy.com/https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat -O geosite.dat || {
    echo "错误：无法下载 geosite.dat"
    exit 1
}

# 导出 geosite 的 cn 分类（国内域名）
python3 v2ray-geosite.py --dat geosite.dat --category cn > geosite_cn.txt || {
    echo "错误：导出 geosite_cn.txt 失败"
    exit 1
}

# 导出 geosite 的非 cn 分类（国外域名）
python3 v2ray-geosite.py --dat geosite.dat --category geolocation-!cn > geosite_non_cn.txt || {
    echo "错误：导出 geosite_non_cn.txt 失败"
    exit 1
}

# 下载预生成的 geoip:cn 列表
wget https://ghproxy.com/https://github.com/Loyalsoldier/geoip/raw/release/cn.txt -O geoip_cn.txt || {
    echo "错误：无法下载 geoip_cn.txt"
    exit 1
}

# 清理临时文件
rm -f geosite.dat v2ray-geosite.py
