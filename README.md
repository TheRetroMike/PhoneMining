# Android-Mining
Quick installation of crypto mining on Android Phones

## Termux Installation instructions
- install Termux app
- install Termux Boot app
- Open Termux Boot app once and close
-  Open Termux app once, wait for bootstrap completion, and then check cpu core count
```bash
lscpu
```

### Verus + AdventureCoin Mining
Install miners and set it to auto start on phone boot with the following (replace pool url, wallet address, password, and thread count with your settings)
Determine CPU thread affinity here: https://bitsum.com/tools/cpu-affinity-calculator/
Example Params: 

8-Core (4 core for Verus and 4 core for AdventureCoin)
```bash
apt update -y && apt install wget -y && wget https://raw.githubusercontent.com/TheRetroMike/PhoneMining/refs/heads/main/termux_vrsc_advc_dual.sh && chmod +x termux_vrsc_advc_dual.sh && ./termux_vrsc_advc_dual.sh "stratum+tcp://na.luckpool.net:3960" "RKbgnfWAbL43K1HrxLoWcDzRmTspYFRj6U" "x" "8" "0xf" "stratum+tcp://retromike.net:5018" "AUj1eDiQU2JZGXfZKcXk17npLZo6LkdnDw" "x" "8" "0xf0" && rm termux_vrsc_advc_dual.sh
```
If you want to modify your settings later, you can always do so by adjust the startup.sh file
```
nano ~/startup.sh
```
