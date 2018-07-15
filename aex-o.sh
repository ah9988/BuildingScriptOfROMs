#!/bin/bash
echo " ▄▄▄·       .▄▄ ·  ▄▄▄·▄▄▄ .▐▄• ▄ ▄▄▄▄▄▄▄▄ . ▐ ▄ ·▄▄▄▄  ▄▄▄ .·▄▄▄▄"
echo "▐█ ▀█ ▪     ▐█ ▀. ▐█ ▄█▀▄.▀· █▌█▌▪•██  ▀▄.▀·•█▌▐███▪ ██ ▀▄.▀·██▪ ██"
echo "▄█▀▀█  ▄█▀▄ ▄▀▀▀█▄ ██▀·▐▀▀▪▄ ·██·  ▐█.▪▐▀▀▪▄▐█▐▐▌▐█· ▐█▌▐▀▀▪▄▐█· ▐█▌"
echo "▐█ ▪▐▌▐█▌.▐▌▐█▄▪▐█▐█▪·•▐█▄▄▌▪▐█·█▌ ▐█▌·▐█▄▄▌██▐█▌██. ██ ▐█▄▄▌██. ██"
echo " ▀  ▀  ▀█▄▀▪ ▀▀▀▀ .▀    ▀▀▀ •▀▀ ▀▀ ▀▀▀  ▀▀▀ ▀▀ █▪▀▀▀▀▀•  ▀▀▀ ▀▀▀▀▀•"
echo "Unofficial Building Script By EarthC"
echo "Guthub: https://github.com/1552980358"
echo "AospExtended Project Founder \"ishubhamsingh\""
echo "AospExtended Official Website https://aospextended.com/"
echo "Github: https://github.com/AospExtended"
echo "===================================================================================="
echo "It is now" `date`
echo "===================================================================================="
echo "1.Set up repo tool at $HOME/bin if your system does not supply repo in apt"
echo "2.Make directory 'aex'at $HOME and sync AOSP source code with AEX"
echo "3.Directly make aex"
echo "4.Make aex with make clean"
echo "5.Make aex with repo sync"
echo "6.Make aex with repo sync and make clean"
echo "===================================================================================="
echo -n "Enter your choise >"
read choice
echo "===================================================================================="
case $choice in
1)
	echo "You choose \"Set up repo tool at $HOME/bin if your system does not supply repo in apt\"."
	echo "Enter to continue or Ctrl+C to stop script."
	read
	echo "===================================================================================="
	mkdir ~/bin
	PATH=~/bin:$PATH
	echo "===================================================================================="
	curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	chmod a+x ~/bin/repo
	echo "===================================================================================="
	echo "Process ended."
	echo "===================================================================================="
	;;
2)
	echo "You choose \"Make directory 'aex' and sync AOSP source code with AEX\"."
	echo "Enter to continue or Ctrl+C to stop script."
	read
	echo "===================================================================================="
	cd $HOME
	mkdir aex
	cd aex	
	repo init -u git://github.com/AospExtended/manifest.git -b 8.1.x
	repo sync -c -j24 --force-sync --no-clone-bundle --no-tags
	echo "===================================================================================="
	echo "Process ended."
	echo "===================================================================================="
	echo -n "Make up a device.xml at $HOME/aex/.repo/local_manifests with source of your device's "
	echo "device , vendor ,kernel and all common of above."
	echo "Finally run the script with choice \"4\" and start building!"
	;;
3)	
	echo "You choose to \"Directly make aex\"."
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	p1="aosp_"
	p2="-userdebug"
	total=${p1}${device}${p2}
	. build/envsetup.sh
	lunch $total
	mka aex -j8
	;;
4)	
	echo "You choose to \"Make aex with make clean\""
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	p1="aosp_"
	p2="-userdebug"
	total=${p1}${device}${p2}
	make clean
	. build/envsetup.sh
	lunch $total
	mka aex -j8
	;;
5)	
	echo "You choose to \"Make aex with repo sync\""
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	p1="aosp_"
	p2="-userdebug"
	total=${p1}${device}${p2}
	repo sync -c -j8 --no-tags --no-clone-bundle --force-sync
	. build/envsetup.sh
	lunch $total
	mka aex -j8
	;;
6)	
	echo "You choose to \"Make aex with repo sync and make clean\""
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	p1="aosp_"
	p2="-userdebug"
	total=${p1}${device}${p2}
	repo sync -c -j8 --no-tags --no-clone-bundle --force-sync
	make clean
	. build/envsetup.sh
	lunch $total
	mka aex -j8
	;;

#	echo "Out of choice range. Script stop at `date` ."
#	echo "===================================================================================="
esac
