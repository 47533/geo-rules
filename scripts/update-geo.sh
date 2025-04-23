#!/bin/bash

# 设置工作目录
cd rules

# 导出 geosite 的 cn 分类（国内域名）
sing-box rule-set convert --type geosite --output geosite_cn.txt geosite.dat cn

# 导出 geosite 的非 cn 分类（国外域名）
sing-box rule-set convert --type geosite --output geosite_non_cn.txt geosite.dat geolocation-!cn

# 导出 geoip 的 cn 分类（国内 IP）
sing-box rule-set convert --type geoip --output geoip_cn.txt geoip.dat cn

# 清理临时文件（可选，保留 dat 文件便于调试）
# rm -f geosite.dat geoip.dat
