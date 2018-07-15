#!/bin/bash
echo "L           I NN        N EEEEEEEEEEE         A            GGGGGGGG EEEEEEEEEEE"
echo "L           I N N       N E                  A A          G         E"
echo "L           I N  N      N E                 A   A        G          E"
echo "L           I N   N     N E                A     A      G           E"
echo "L           I N    N    N EEEEEEE         AAAAAAAAA     G      GGGG EEEEEEE"
echo "L           I N     N   N E              A         A    G         G E"
echo "L           I N      N  N E             A           A    G        G E"
echo "L           I N       N N E            A             A    G       G E"
echo "LLLLLLLLLLL I N        NN EEEEEEEEEEE A               A    GGGGGGGG EEEEEEEEEEE" 
echo "Unofficial Building Script By EarthC"
echo "Guthub: https://github.com/1552980358"
echo "LineageOS Website : https://lineageos.org/"
echo "LineageOS Github : https://github.com/LineageOS"
echo "===================================================================================="
echo "It is now" `date`
echo "===================================================================================="
echo "1.Set up repo tool at $HOME/bin if your system does not supply repo in apt"
echo "2.Make directory 'android/lineage' at $HOME and sync AOSP source code with LineageOS"
echo "3.Directly make los"
echo "4.Make los with make clean"
echo "5.Make los with repo sync"
echo "6.Make los with repo sync and make clean"
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
	echo "You choose \"Make directory 'android/lineage' at $HOME and sync AOSP source code with LineageOS\"."
	echo "Enter to continue or Ctrl+C to stop script."
	read
	echo "===================================================================================="
	mkdir -p ~/android/lineage
	cd ~/android/lineage
	repo init -u https://github.com/LineageOS/android.git -b lineage-15.1
	repo sync -c -j24 --force-sync --no-clone-bundle --no-tags
	echo "===================================================================================="
	echo "Process ended."
	echo "===================================================================================="
	;;
3)
	echo "You choose to \"Directly make los\"."
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	source build/envsetup.sh
	breakfast $device
	croot
	brunch $device
	;;
4)
	echo "You choose to \"Make los with make clean\"."
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	make clean
	source build/envsetup.sh
	breakfast $device
	croot
	brunch $device
	;;
5)
	echo "You choose to \"Make los with repo sync\"."
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	repo sync -c -j24 --force-sync --no-clone-bundle --no-tags
	source build/envsetup.sh
	breakfast $device
	croot
	brunch $device
	;;
6)
	echo "You choose to \"Make los with repo sync and make clean\"."
	echo -n "Enter device to continue or Ctrl C to stop script >"
	read device
	echo "===================================================================================="
	make clean
	repo sync -c -j24 --force-sync --no-clone-bundle --no-tags
	source build/envsetup.sh
	breakfast $device
	croot
	brunch $device
	;;
*)
	echo "Out of choice range. Script stop at `date` ."
	echo "===================================================================================="
esac






