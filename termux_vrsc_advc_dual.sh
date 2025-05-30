killall screen
apt update -y 
apt install libcurl openssl libjansson automake build-essential screen git -y

#VRSC
cd ~
rm -rf vrsc_miner
git clone --single-branch -b ARM https://github.com/monkins1010/ccminer.git vrsc_miner
cd vrsc_miner
chmod +x build.sh
chmod +x configure.sh
chmod +x autogen.sh
./build.sh

#ADVC
cd ~
git clone https://github.com/TheRetroMike/AdvcPhoneMiner.git advc_miner
cd advc_miner
./build-armv8.sh

#CONFIG
cd ~
echo "screen 1 vrsc_miner/ccminer -a verus -o $1 -u $2 -p $3 -t $4 --cpu-affinity $5" > dualmine.config
echo "split" >> dualmine.config
echo "focus" >> dualmine.config
echo "screen 2 advc_miner/cpuminer -a YespowerAdvc -o $6 -u $7 -p $8 -t $9 --cpu-affinity ${10}" >> dualmine.config

echo "screen -s \"/bin/bash\" -c ~/dualmine.config -dmS miner" > startup.sh
echo "screen -c dualmine.config" > ui-startup.sh
chmod +x startup.sh
chmod +x ui-startup.sh
mkdir -p ~/.termux/boot
wget https://raw.githubusercontent.com/TheRetroMike/VerusCliMining/refs/heads/main/termux_boot_startup.sh -O ~/.termux/boot/termux_boot_startup.sh
