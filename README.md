# BuildingScriptOfROMs
Script Maker : EarthC

Github: [**https://github.com/1552980358**](https://github.com/1552980358)

Credit
===========
[**Wloot(Liu Nian)**](https://github.com/wloot)

[**AospExtended**](https://aospextended.com/)

[**LineageOS**](https://lineageos.org/)

Supported ROM(s)
===========
1.AospExtended --Oreo

Official Website:[**https://aospextended.com/**](https://aospextended.com/)

Github : [**https://github.com/AospExtended**](https://github.com/AospExtended)

2.LineageOS  --Oreo

Official Website :[**https://lineageos.org/**](https://lineageos.org/)

Github : [**https://github.com/LineageOS**](https://github.com/LineageOS)
		
Download the script		 
===========
```bash
   git clone https://github.com/1552980358/BuildingScriptOfROMs.git
```

Start the script
===========
```bash
   ./<Script name>.sh
```

Get updated
===========
```bash
   git pull -f
```

Other supports
===========
1.Necessary compile packages
```bash
   sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev -y
```

2.Java
For Building 7.x or above
```bash
   sudo apt install openjdk-8-jdk -y
```
For building Android 7.x or lower
```bash
   sudo apt install openjdk-7-jdk -y
   
3.Set up ccache for faster compile
Add following at ~/.bashrc
```bash
   export USE_CCACHE=1
```
and type following at terminal
```bash
   ccache -M 50G
   export CCACHE_COMPRESS=1
```