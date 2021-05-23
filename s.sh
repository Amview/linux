#!/bin/bash
while true
do
    echo ""
    echo " ******************************请输入序号***********************************"
    echo "| 1.chrome浏览器 | 2.卸载chrome浏览器 | 3.firfox浏览器 | 4.卸载firfox浏览器 |"
    echo "| 5.vscode       | 6.卸载vscode|"
    echo " ----------------------------JetBrains 全家桶----------------------------------"
    echo "|  9.dataGrip | 10.卸载dataGrip   | 11.intellij idea |  12.卸载intellij idea   |"
    echo "|  13.Pycharm | 14.卸载Pycharm    | 15.WebStrom      |  16.卸载WebStrom        |"
    path="/opt"
    read num 
    case $num in
    1)
        name=google-chrome-stable
		echo ""
		dl=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        read -r -p "是否下载"$name"? [(默认)Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.deb ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.deb
                    wget $dl
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget $dl
                fi

                #安装
                sudo dpkg -i $name*.deb
				sleep 1
				echo "---->安装完成！"
                ;;

                [nN])
                    echo "No"
                    ;;
            esac
            ;;

    2)
        name=google-chrome-stable
		echo ""
        read -r -p "是否卸载"$name"? [(默认)Y/n] " input
            case $input in
                [Yy])
                		read -r -p "是否保留"$name"配置? [(默认)Y/n] " input
            				case $input in
                				[Yy])
								sudo apt-get remove $name
							;;
							[nN])
                    				sudo apt-get --purge remove $name
                     		;;
						esac
						
                		;;

                [nN])
                    echo "No"
                    ;;
            esac
            ;;



    3)
        name=code
		echo ""
        dl=https://az764295.vo.msecnd.net/stable/054a9295330880ed74ceaedda236253b4f39a335/code_1.56.2-1620838498_amd64.deb
        read -r -p "是否下载"$name"? [Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.deb ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.deb
                    wget $sl
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget $dl
                fi

                #安装
                sudo dpkg -i $name*.deb
				sleep 1
				echo "安装完成！"
                ;;

                [nN])
                    echo "No"
                    ;;
            esac
            ;;

    4)
        name=code
		echo ""
        read -r -p "是否卸载"$name"? [Y/n] " input
            case $input in
                [Yy])
                		read -r -p "是否保留"$name"配置? [Y/n] " input
            				case $input in
                				[Yy])
								sudo apt-get remove $name
							;;
							[nN])
                    				sudo apt-get --purge remove $name
                     		;;
						esac
						
                		;;

                [nN])
                    echo "No"
                    ;;
            esac
            ;;
    9)
        name=datagrip
        time=2021.1.1
        exec_name=datagrip
        dir_name=DataGrip
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications
        read -r -p "是否下载"$name"? [Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.tar.gz ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.tar.gz
                    wget https://download.jetbrains.com.cn/"$exec_name"/"$name"-"$time".tar.gz
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget https://download.jetbrains.com.cn/"$exec_name"/"$name"-"$time".tar.gz
                fi

                #安装
                if [ -d  "$path"/"$name"*/  ];then
                    echo "删除"$name"文件夹"
                    sleep 1
                    sudo rm -rf "$path"/"$name"*/                   
                fi
                echo "解压"
                sudo tar -xvf "$name"-"$time".tar.gz -C  $path
                sudo mv "$path"/$dir_name*  "$path"/$name
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

    10)
        name=datagrip
        exec_name=datagrip
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications/"$name".desktop
        read -r -p "是否卸载"$name"? [Y/n] " input
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

    11)
        name=ideaIU
        time=2021.1.1
        exec_name=idea
        dir_name=idea-IU
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications
        read -r -p "是否下载"$name"? [Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.tar.gz ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.tar.gz
                    wget https://download.jetbrains.com.cn/"$exec_name"/"$name"-"$time".tar.gz
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget https://download.jetbrains.com.cn/"$exec_name"/"$name"-"$time".tar.gz
                fi

                #安装
                if [ -d  "$path"/"$name"*/  ];then
                    echo "删除"$name"文件夹"
                    sleep 1
                    sudo rm -rf "$path"/"$name"*/                   
                fi
                echo "解压"
                sudo tar -xvf "$name"-"$time".tar.gz -C  $path
                sudo mv "$path"/$dir_name*  "$path"/$name
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

    12)
        name=ideaIU
        exec_name=idea
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications/"$name".desktop
        read -r -p "是否卸载"$name"? [Y/n] " input
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

    13)
        name=pycharm-professional
        time=2021.1.1
        dl_name=python
        exec_name=pycharm
        dir_name=pycharm
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications
        read -r -p "是否下载"$name"? [Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.tar.gz ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.tar.gz
                    wget https://download.jetbrains.com.cn/"$dl_name"/"$name"-"$time".tar.gz
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget https://download.jetbrains.com.cn/"$dl_name"/"$name"-"$time".tar.gz
                fi

                #安装
                if [ -d  "$path"/"$name"*/  ];then
                    echo "删除"$name"文件夹"
                    sleep 1
                    sudo rm -rf "$path"/"$name"*/                   
                fi
                echo "解压"
                sudo tar -xvf "$name"-"$time".tar.gz -C  $path
                sudo mv "$path"/$dir_name*  "$path"/$name
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

    14)
        name=pycharm-professional
        exec_name=pycharm
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications/"$name".desktop
        read -r -p "是否卸载"$name"? [Y/n] " input
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



    15)
        name=WebStorm
        time=2021.1.1
        exec_name=webstorm
        echo "安装目录""$path"/$name
        echo "图标目录"/usr/share/applications
        read -r -p "是否下载"$name"? [Y/n] " input
            case $input in
                [Yy])
                echo "正在下载"$name
                #下载
                if [ -e ./"$name"*.tar.gz ];then
                    echo "---->文件已经存在，删除旧版文件"
                    sleep 0.5
                    rm -f "$name"*.tar.gz
                    wget https://download.jetbrains.com.cn/"$exec_name"/"$name"-"$time".tar.gz
                else
                    echo "---->文件不存在，正在下载"
                    sleep 0.5
                    wget https://download.jetbrains.com.cn/"$exec_name"/"$name"-"$time".tar.gz
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
        read -r -p "是否卸载"$name"? [Y/n] " input
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
