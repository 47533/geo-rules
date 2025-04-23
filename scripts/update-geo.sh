#!/bin/bash

# 设置工作目录
cd rules

# 确保 v2ray-geosite.py 存在
if [ ! -f "v2ray-geosite.py" ]; then
    echo "错误：v2ray-geosite.py 未找到！"
    exit 1
fi

# 下载 geosite.dat
wget https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat -O geosite.dat

# 导出 geosite 的 cn 分类（国内域名）
python3 v2ray-geosite.py --dat geosite.dat --category cn > geosite_cn.txt

# 导出 geosite 的非 cn 分类（国外域名）
python3 v2ray-geosite.py --dat geosite.dat --category geolocation-!cn > geosite_non_cn.txt

# 下载预生成的 geoip:cn 列表
wget https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/cn.txt -O geoip_cn.txt

# 清理临时文件
rm -f geosite.dat v2ray-geosite.py
