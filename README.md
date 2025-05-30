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

### Verus + AdventureCoin Dual Mining
Install miners and set it to auto start on phone boot with the following (replace pool url, wallet address, password, and thread count with your settings). On reboot, miners will start automatically, but you need to do ```screen -r miner``` to attach and then use ctrl+a twice to switch between the two miner windows. Alternatively, you can exit both windows with ctrl+c and then run ```~/uistartup.sh``` the get the split view.

Determine CPU thread affinity here: https://bitsum.com/tools/cpu-affinity-calculator/
- Param 1: VRSC Pool URL
- Param 2: VRSC Wallet
- Param 3: VRSC Password
- Param 4: VRSC Threads
- Param 5: VRSC CPU Affinity
- Param 6: ADVC Pool URL
- Param 7: ADVC Wallet
- Param 8: ADVC Password
- Param 9: ADVC Threads
- Param 10: ADVC CPU Affinity

#### 8-Core (4 core for Verus and 4 core for AdventureCoin)
```bash
apt update -y && apt install wget -y && wget https://raw.githubusercontent.com/TheRetroMike/PhoneMining/refs/heads/main/termux_vrsc_advc_dual.sh && chmod +x termux_vrsc_advc_dual.sh && ./termux_vrsc_advc_dual.sh "stratum+tcp://na.luckpool.net:3960" "RKbgnfWAbL43K1HrxLoWcDzRmTspYFRj6U" "x" "4" "0xf" "stratum+tcp://retromike.net:5018" "AUj1eDiQU2JZGXfZKcXk17npLZo6LkdnDw" "x" "4" "0xf0" && rm termux_vrsc_advc_dual.sh && ~/ui-startup.sh
```


#### 6-Core (3 core for Verus and 3 core for AdventureCoin)
```bash
apt update -y && apt install wget -y && wget https://raw.githubusercontent.com/TheRetroMike/PhoneMining/refs/heads/main/termux_vrsc_advc_dual.sh && chmod +x termux_vrsc_advc_dual.sh && ./termux_vrsc_advc_dual.sh "stratum+tcp://na.luckpool.net:3960" "RKbgnfWAbL43K1HrxLoWcDzRmTspYFRj6U" "x" "3" "0x7" "stratum+tcp://retromike.net:5018" "AUj1eDiQU2JZGXfZKcXk17npLZo6LkdnDw" "x" "3" "0x38" && rm termux_vrsc_advc_dual.sh && ~/ui-startup.sh
```

If you want to modify your settings later, you can always do so by adjusting the dualmine.config file
```
nano ~/dualmine.config
```
