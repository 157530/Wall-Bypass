#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[38;5;51m'
GREEN='\033[0;32m'
PURPLE='\033[38;5;201m'
NC='\033[0m'

command -v adb >/dev/null 2>&1 || pkg install android-tools -y
command -v curl >/dev/null 2>&1 || pkg install curl -y

P_URL="https://github.com/157530/Wall-Bypass/raw/refs/heads/main/P"
WHITE_URL="https://github.com/157530/Wall-Bypass/raw/refs/heads/main/White"
SHADERS_URL="https://github.com/157530/Wall-Bypass/raw/refs/heads/main/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D"
OPTIONAL_AVATAR_URL="https://github.com/157530/Wall-Bypass/raw/refs/heads/main/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D"

[ ! -f "$HOME/P" ] && curl -fsSL "$P_URL" -o "$HOME/P" && chmod 600 "$HOME/P"
[ ! -f "$HOME/White" ] && curl -fsSL "$WHITE_URL" -o "$HOME/White" && chmod 600 "$HOME/White"
[ ! -f "$HOME/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D" ] && curl -fsSL "$SHADERS_URL" -o "$HOME/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D" && chmod 600 "$HOME/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D"
[ ! -f "$HOME/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D" ] && curl -fsSL "$OPTIONAL_AVATAR_URL" -o "$HOME/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D" && chmod 600 "$HOME/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D"

parear_adb() {
clear
echo -ne "${CYAN}[#] Porta de pareamento (ex: 45678): ${NC}"
read PAIR_PORT
echo -e "${YELLOW}[!] Digite o código de pareamento no celular e pressione Enter.${NC}"
adb pair localhost:$PAIR_PORT >/dev/null 2>&1
echo -ne "${CYAN}[#] Porta de conexão (ex: 12345): ${NC}"
read CONNECT_PORT
adb connect localhost:$CONNECT_PORT >/dev/null 2>&1
sleep 1
}

executar_freefire() {
clear
APK_PATH="/data/app/~~iDxQTB8ePhnknIL7qC6nwQ==/com.dts.freefireth-PkkBXkPTJt2xHrM-nB6Czw==/base.apk"

MODIFY_LINE=$(adb shell stat -c "%y" "$APK_PATH" 2>/dev/null | tr -d '\r')
CHANGE_LINE=$(adb shell stat -c "%z" "$APK_PATH" 2>/dev/null | tr -d '\r')

adb shell settings put global auto_time 0 >/dev/null 2>&1
adb shell settings put global auto_time_zone 0 >/dev/null 2>&1
adb shell am start -a android.settings.DATE_SETTINGS >/dev/null 2>&1

sleep 40

TARGET_MOD_SEC=$(echo "$MODIFY_LINE" | cut -d':' -f3 | cut -d'.' -f1)
TARGET_CHG_SEC=$(echo "$CHANGE_LINE" | cut -d':' -f3 | cut -d'.' -f1)

while true; do
NOW_SEC=$(adb shell date +%S | tr -d '\r')
[ "$NOW_SEC" = "$TARGET_MOD_SEC" ] || [ "$NOW_SEC" = "$TARGET_CHG_SEC" ] && break
done

dd if="$HOME/P" bs=4M 2>/dev/null | adb shell \
"dd of='/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/gameassetbundles/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D' bs=4M" \
>/dev/null 2>&1

adb shell settings put global auto_time 1 >/dev/null 2>&1
adb shell settings put global auto_time_zone 1 >/dev/null 2>&1
adb logcat -c >/dev/null 2>&1
}

instalar_opcao2() {
clear
dd if="$HOME/White" bs=4M 2>/dev/null | adb shell \
"dd of='/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/gameassetbundles/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D' bs=4M" \
>/dev/null 2>&1
sleep 1
}

instalar_opcao3() {
clear
cp -p "$HOME/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D" \
"/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/gameassetbundles/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D"

cp -p "$HOME/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D" \
"/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D"
sleep 1
}

while true; do
clear
echo -e "${CYAN}https://discord.gg/injectbypass${NC}\n"

echo -e "  )       (     (          ("
echo -e "  ( /(       )\\ )  )\\ )       )\\ )"
echo -e "  )\\()) (   (()/( (()/(  (   (()/("
echo -e "  |((_)\\  )\\   /(_)) /(_)) )\\   /(_))"
echo -e "  |_ ((_)((_) (_))  (_))  ((_) (_))"
echo -e "  | |/ / | __|| |   | |   | __|| _ \\"
echo -e "  ' <  | _| | |__ | |__ | _| |   /"
echo -e "  _|\\_\\ |___||____||____||___||_|_\\\n"

echo -e "${CYAN}  Coded By: Axx | Credits: Thx${NC}\n"

echo -e "${PURPLE}╔══════════════════════════╗${NC}"
echo -e "${PURPLE}║      MENU PRINCIPAL      ║${NC}"
echo -e "${PURPLE}╚══════════════════════════╝${NC}\n"

echo -e "${YELLOW}[0]${NC} Conectar ADB"
echo -e "${GREEN}[1]${NC} Bypass FreeFire Normal"
echo -e "${GREEN}[2]${NC} Inject WallHack White"
echo -e "${GREEN}[3]${NC} Inject WallHack 3D"
echo -e "${RED}[S]${NC} Sair\n"

echo -ne "${CYAN}  ▸ Escolha uma opção: ${NC}"
read OP

case "$OP" in
0) parear_adb ;;
1) executar_freefire ;;
2) instalar_opcao2 ;;
3) instalar_opcao3 ;;
S|s) exit 0 ;;
*) sleep 1 ;;
esac
done