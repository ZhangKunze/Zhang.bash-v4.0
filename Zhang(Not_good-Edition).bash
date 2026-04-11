#!/system/bin/sh
echo "注意：本脚本已不再维护，如需使用最新版的功能，请安装Termux，并使用Zhang.bash。（具体的情况见README）"
uname -a
sleep 3
whoami
sleep 1
id
sleep 4
echo '是否要等待?Sleep or not sleep?[Y/n]'
read YN
if [ "$YN" = "y" ]; then
sleep 4
fi
if [ "$YN" = "n" ]; then
echo "好的，那就不等了。Ok,these not sleep."
fi
pwd
sleep 2
#以下是循环菜单
while [ 1 = 1 ]; do
    echo "================================"
    echo "[1] cd home       # 返回首页"
    echo "[2] ls            # 列出文件"
    echo "[3] ls -la        # 详细列表"
    echo "[4] Exit          # 退出程序"
    echo "[5] log           # 保存日志"
    echo "[0] Back          # 返回上级"
    echo "================================"
    echo -n "Your choice? 请选择: "
    read choice
    
    case "$choice" in
        0|"exit"|"quit"|"退出")
            echo "Goodbye! 再见！"
            exit 0
            ;;
        1)
            cd
            echo "Changed to $HOME 已切换到$HOME"
            ;;
        2)
            ls
            ;;
        3)
            ls -la
            ;;
        4)
            echo "Exiting... 正在退出..."
            exit 0
            ;;
        5)
         mkdir -p /sdcard/Zhang.bash.log/
         echo "$(date) $(whoami)" >> /sdcard/Zhang.bash.log/runing.log
            ;;
         *)
         echo "🆘无效选择！🆘"
    esac
done