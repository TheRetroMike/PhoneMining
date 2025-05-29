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
echo "screen -dmS vrsc_miner ~/ccminer/ccminer -a verus -o $1 -u $2 -p $3 -t $4 --cpu-affinity $5 >> miner.log" > startup.sh
echo "screen -dmS advc_miner ~/advc_miner/cpuminer -a YespowerAdvc -o $6 -u $7 -p $8 -t $9 --cpu-affinity $10 >> miner.log" >> startup.sh
echo "screen -dmS miner tail -f ~/miner.log" >> startup.sh
chmod +x startup.sh
mkdir -p ~/.termux/boot
wget https://raw.githubusercontent.com/TheRetroMike/VerusCliMining/refs/heads/main/termux_boot_startup.sh -O ~/.termux/boot/termux_boot_startup.sh
~/startup.sh
echo "------------------------------"
echo "Miner is installed and running. Update config using nano startup.sh"
echo "To view Verus miner now or after restart, use screen -r vrsc_miner"
echo "To view AdventureCoin miner now or after restart, use screen -r advc_miner"
echo "------------------------------"
screen -r miner
