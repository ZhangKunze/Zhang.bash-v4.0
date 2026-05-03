#!/data/data/com.termux/files/usr/bin/bash
[ -f ~/.Zhang.bash ] && . ~/.Zhang.bash
case $1 in
-v|-version) echo -e "This is Zhang.bash,version:4.0.\n这是 Zhang.bash，版本：4.0。" && return 0 ;;
-zkz) echo "启动 zkz 彩蛋！" && ./zkz && return 0 ;;
-h|-help) echo -e "本脚本是一个终端增强工具，旨在为用户提供更加方便管理系统的界面，选项\n-v/-version：显示版本号\n-h/-help：显示帮助信息\n-zkz：启动 'zkz' 彩蛋脚本" ;;
esac
export zhang_bash_run=true
echo "请确认您的终端环境是官方版的(来源通常在github、Coolapk等)"
echo "防止恶意版本窃取您的信息"
echo '安全确认...'
read -p "继续？[Y/n] " an_quan
if [[ "$an_quan" =~ ^[Nn]$ ]]; then
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
[[ "$LOOK" =~ ^[Nn]$ ]] && echo '那就再等一会儿…' && sleep 5 || echo "那就进行下一步了"
#以下是循环菜单
while true; do
echo -e "\033[36m-------------------------------------------------------\033[0m"
echo -e "\033[36m|\033[0m[1]回到家目录。cd home                               \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[2]列出当前目录的所有文件。ls                        \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[3]列出当前目录所有文件，包括所有者和属性。ls -la    \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[4]保存日志。log                                     \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[5]当前路径。pwd                                     \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[6]网络测试。ping(baidu|百度)                        \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[7]安装软件。apt install                             \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[8]打开Python。Open Python                           \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[9]保存某行命令到配置文件。Save a command to file.   \033[36m|\033[0m"
echo -e "\033[36m|\033[0m[0]退出。exit                                        \033[36m|\033[0m"
echo -e "\033[36m-------------------------------------------------------\033[0m"
read -e -p "选择哪一个? " YYN
if ! [[ "$YYN" =~ ^[0-9]+$ ]]; then
    eval "$YYN"
    continue
fi
case $YYN in
1) cd ;;
2) ls ;;
3) ls -la ;;
4) mkdir -p /sdcard/Zhang.bash.log
echo "$(date) $(whoami)" >> /sdcard/Zhang.bash.log/runing.log
;;
5) pwd ;;
6) ping -c 4 -W 1 baidu.com >/dev/null 2>&1 && echo "🌐 已联网" || echo "📴 未联网"
ping -c 4 baidu.com | grep -E "(packet loss|rtt min/avg/max)"
;;
7) read -p "请输入你要安装软件包的准确包名。Please provide the exact package name of the software you want to install." install
pkg install $install
;;
8) echo '请确保您先前已经运行了"pkg install python"这条命令后再使用 。Please you run "pkg install python"command.l'
python
;;
9)
read -e -p "请输入要保存的命令: " cmd
echo "$cmd" >> ~/.Zhang.bash
echo "已保存到 ~/.Zhang.bash"
;;
0) break ;;
*) echo "🆘🆘无效选择！🆘🆘🆘" ;;
esac
done