#!/bin/sh
# 获取当前文件目录
dir=$(cd $(dirname $0); pwd)
# ip.txt用来保存IP地址，如果IP地址没有发生变化，则不进行地址更新，重复提交地址更新官方会封号。
iptxt="$dir""/ip.txt"
# 获取IPv6地址
ip=$(ip -6 addr list scope global $device | grep -v " fd" | sed -n 's/.*inet6 \([0-9a-f:]\+\).*/\1/p' | head -n 1)
if [ "${ip:-none}" == "none" ]
then
  echo "[ddns] 获取IP错误！"
  exit 12
fi
if [ -f $iptxt ]
then
  oldip=$(tail -n 1 $iptxt)
else
  oldip="::"
fi
# 与ip.txt中的IP地址对比，如果一致，则退出；如果不一致，则将新IP写入ip.txt文件中，并提交动态域名更新。
if [ "$ip" == "$oldip" ]
then
  echo "[ddns] IP无变化！"
  exit 0
fi
# 将变化的ip地址写入ip.txt
echo $ip > $iptxt
# 更新动态域名IP地址，xxxxxx.msns.cn为申请的域名，“pwd=”后面为密码
url="http://www.meibu.com/ipv6zdz.asp?ipv6=${ip}&name=jiandjh.msns.cn&pwd=ttcs2206506"
re=`curl -s $url`
echo "[ddns] 更新域名成功！"