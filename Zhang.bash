#!/data/data/com.termux/files/usr/bin/bash
echo "请确认您的终端环境是官方版的(来源通常在github、Coolapk等)"
echo "防止恶意版本窃取您的信息"
echo '安全确认...'
read -p "继续？[Y/n] " response

if [[ "$response" =~ ^[Nn]$ ]]; then
    echo -e "^C"
    exit 130
fi

echo "继续执行..."
echo '------------------------------------------------------'
echo "     用户：User：$(whoami)"
echo "     SELinux上下文：$(id -Z)"
echo "     系统架构：system architecture：$(uname -m)"
echo "     内核版本：kernel version：$(uname -v)"
echo "     当前路径：Working directory：$(pwd)"
echo "     时间：time：$(date)"
echo '-----------------------------------------------------'
read -p '看完了吗？Have you finished reading it？[Y/n]' LOOK
if [[ "$LOOK" =~ ^[Yy]$ ]]; then
echo "那就进行下一步了"
fi
if [[ "$LOOK" =~ ^[Nn]$ ]]; then
echo '那就再等一会儿…'
sleep 5
fi
if [[ -z "$LOOK" ]]; then
echo "那就进行下一步了"
fi
#以下是循环菜单
while true; do
echo '------------------------------------------------------'
echo '[1]回到家目录。cd home                               |'
echo '[2]列出当前目录的所有文件。ls                        |'
echo '[3]列出当前目录所有文件，包括所有者和属性。ls -la    |'
echo '[4]保存日志。log                                     |'
echo '[5]当前路径。pwd                                     |'
echo '[6]网络测试。ping(baidu|百度)                        |'
echo '[7]安装软件。apt install                             |'
echo '[8]打开Python。Open Python                           |'
echo '[0]退出。exit                                        |'
echo '------------------------------------------------------'
read -p "选择哪一个?" YYN
if [[ "$YYN" = "1" ]]; then
cd
elif [[ "$YYN" = "2" ]]; then
ls
elif [[ "$YYN" = "3" ]]; then
ls -la
elif [ "$YYN" = "5" ]; then
pwd
elif [ "$YYN" = "6" ]; then
ping -c 4 -W 1 baidu.com >/dev/null 2>&1 && echo "🌐 已联网" || echo "📴 未联网"
ping -c 4 baidu.com | grep -E "(packet loss|rtt min/avg/max)"
elif [[ "$YYN" = "0" ]]; then
exit 0
elif [[ "$YYN" =~ ^[4]$ ]]; then
mkdir -p /sdcard/Zhang.bash.log
echo "$(date) $(whoami)" >> /sdcard/Zhang.bash.log/runing.log
elif [[ "$YYN" = "7" ]]; then
read -p "请输入你要安装软件包的准确包名。Please provide the exact package name of the software you want to install." install
pkg install $install
elif [[ "$YYN" = "8" ]]; then
echo '请确保您先前已经运行了"pkg install python"这条命令后再使用。Please you run "pkg install python"command.l'
python
else
    echo "🆘🆘无效选择！🆘🆘"
fi
done
