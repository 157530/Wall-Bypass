#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[38;5;51m'
GREEN='\033[0;32m'
PURPLE='\033[38;5;201m'
NC='\033[0m'

command -v adb >/dev/null 2>&1 || pkg install android-tools -y
command -v curl >/dev/null 2>&1 || pkg install curl -y

P_URL="https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPOSITORIO/main/P"
WHITE_URL="https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPOSITORIO/main/White"
SHADER_URL="https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPOSITORIO/main/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D"
OPTIONAL_URL="https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPOSITORIO/main/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D"

baixar() {
[ -f "$HOME/$1" ] || {
curl -fsSL "$2" -o "$HOME/$1" || exit 1
chmod 600 "$HOME/$1"
}
}

baixar P "$P_URL"
baixar White "$WHITE_URL"
baixar shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D "$SHADER_URL"
baixar optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D "$OPTIONAL_URL"

parear_adb() {
clear
echo -ne "${CYAN}[#] Porta de pareamento: ${NC}"
read PAIR_PORT
adb pair localhost:$PAIR_PORT >/dev/null 2>&1
echo -ne "${CYAN}[#] Porta de conexão: ${NC}"
read CONNECT_PORT
adb connect localhost:$CONNECT_PORT >/dev/null 2>&1
sleep 1
}

executar_freefire() {
clear

APK_PATH="/data/app/~~iDxQTB8ePhnknIL7qC6nwQ==/com.dts.freefireth-PkkBXkPTJt2xHrM-nB6Czw==/base.apk"

MODIFY_LINE=$(adb shell stat -c "%y" "$APK_PATH" | tr -d '\r')
CHANGE_LINE=$(adb shell stat -c "%z" "$APK_PATH" | tr -d '\r')

adb shell settings put global auto_time 0 >/dev/null
adb shell settings put global auto_time_zone 0 >/dev/null
adb shell am start -a android.settings.DATE_SETTINGS >/dev/null

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

adb shell settings put global auto_time 1 >/dev/null
adb shell settings put global auto_time_zone 1 >/dev/null
adb logcat -c >/dev/null
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

dd if="$HOME/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D" bs=4M 2>/dev/null | adb shell \
"dd of='/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/gameassetbundles/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D' bs=4M" \
>/dev/null 2>&1

dd if="$HOME/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D" bs=4M 2>/dev/null | adb shell \
"dd of='/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D' bs=4M" \
>/dev/null 2>&1

sleep 1
}

while true; do
clear

cat << EOF
  )       (     (          (
  ( /(       )\\ )  )\\ )       )\\ )
  )\\()) (   (()/( (()/(  (   (()/(
  |((_)\\  )\\   /(_)) /(_)) )\\   /(_))
  |_ ((_)((_) (_))  (_))  ((_) (_))
  | |/ / | __|| |   | |   | __|| _ \\
  ' <  | _| | |__ | |__ | _| |   /
  _|\\_\\ |___||____||____||___||_|_\\

${CYAN}  Coded By: Axx | Credits: Thx${NC}
EOF

cat << EOF
${PURPLE}╔══════════════════════════╗
║      MENU PRINCIPAL      ║
╚══════════════════════════╝${NC}

${YELLOW}[0]${NC} Conectar ADB "Depuração por Wi-Fi"
${GREEN}[1]${NC}Bypass FreeFire Normal
${CYAN}[2]${NC} Inject WallHack White
${CYAN}[3]${NC} Inject WallHack 3D
${RED}[S]${NC} Sair
EOF

echo -ne "${CYAN}▸ Escolha uma Opção: ${NC}"
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