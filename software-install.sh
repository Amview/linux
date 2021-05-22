#!/bin/bash
while true
do
    echo ""
    echo "******************************请输入序号**************************"
    echo " ----------------------------JetBrains 全家桶----------------------------------"
    echo "15.WebStrom  |  16.卸载WebStrom  |"
    path="/opt"
    read num 
    case $num in
    1)
        name=WebStorm
        time=2021.1.1
        exec_name=webstorm
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications
        read -r -p "是否下载"$name"? [(默认)Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.tar.gz ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.tar.gz
                    wget https://download.jetbrains.com.cn/webstorm/"$name"-"$time".tar.gz
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget https://download.jetbrains.com.cn/webstorm/"$name"-"$time".tar.gz
                fi

                #安装
                if [ -d  "$path"/"$name"*/  ];then
                    echo "删除"$name"文件夹"
                    sleep 1
                    sudo rm -rf "$path"/"$name"*/                   
                fi
                echo "解压"
                sudo tar -xvf "$name"-"$time".tar.gz -C  $path
                sudo mv "$path"/$name*  "$path"/$name
                #cd /usr/share/applications
                
                echo "创建图标"
                sleep 1
                touch $name.desktop && chmod +w $name.desktop
                sudo echo "[Desktop Entry]" >> $name.desktop
                sudo echo "Version=1.0" >> $name.desktop
                sudo echo "Name="$name >> $name.desktop
                sudo echo "Exec="$path"/"$name"/bin/"$exec_name".sh %U" >> $name.desktop
                sudo echo "Terminal=false" >> $name.desktop
                sudo echo "Icon=/opt/"$name"/bin/"$exec_name".png" >> $name.desktop
                sudo echo "Type=Application" >> $name.desktop
                sudo mv $name.desktop    /usr/share/applications
                echo "安装完成"  /usr/share/applications
                ;;

                [nN])
                    echo "No"
                    ;;
            esac
            ;;

    16)
        name=WebStorm
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications/"$name".desktop
        read -r -p "是否卸载"$name"? [(默认)Y/n] " input
        case $input in
            [yY])
            if [ -d "$path"/$name ];then
                echo "---->发现"$name"文件夹"
                sleep 1
                sudo rm -rf "$path"/$name
            fi
            if [ -e "/usr/share/applications/"$name".desktop" ];then
                echo "---->发现"$name".desktop"
                sleep 1
                sudo rm -f /usr/share/applications/$name.desktop
            fi
            echo "-->已经卸载"$name
            sleep 1
            ;;

            [nN])
                    echo "No"
                    ;;
        esac
        ;;
    
    esac
    exit 1
done
