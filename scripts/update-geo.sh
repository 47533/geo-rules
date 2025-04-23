#!/bin/bash

# 设置工作目录
cd rules

# 导出 geosite 的 cn 分类（国内域名）
v2ray-geosite --dat geosite.dat --category cn > geosite_cn.txt

# 导出 geosite 的非 cn 分类（国外域名）
v2ray-geosite --dat geosite.dat --category geolocation-!cn > geosite_non_cn.txt

# 直接复制 geoip_cn.txt（v2ray-geosite 不支持 geoip，暂时使用完整 geoip.dat）
cp geoip.dat geoip_cn.txt

# （可选）清理临时文件
# rm -f geosite.dat geoip.dat
