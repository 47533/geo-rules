#!/bin/bash

# 设置工作目录
cd rules

# 确保 v2ray-geosite 可执行文件存在
if [ ! -f "v2ray-geosite.py" ]; then
    echo "错误：v2ray-geosite.py 未找到！"
    exit 1
fi

# 导出 geosite 的 cn 分类（国内域名）
python3 v2ray-geosite.py --dat geosite.dat --category cn > geosite_cn.txt

# 导出 geosite 的非 cn 分类（国外域名）
python3 v2ray-geosite.py --dat geosite.dat --category geolocation-!cn > geosite_non_cn.txt

# 导出 geoip 的 cn 分类（国内 IP）
# 注意：sing-box 可能不支持直接提取 geoip:cn，临时复制 geoip.dat
cp geoip.dat geoip_cn.txt

# （可选）清理临时文件
# rm -f geosite.dat geoip.dat
