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
printf "%b" "${CYAN}[#] Porta de pareamento (ex: 45678): ${NC}"
read PAIR_PORT
printf "%b" "${YELLOW}[!] Digite o código de pareamento no celular e pressione Enter.${NC}\n"
adb pair localhost:$PAIR_PORT
printf "%b" "${CYAN}[#] Porta de conexão (ex: 12345): ${NC}"
read CONNECT_PORT
adb connect localhost:$CONNECT_PORT
sleep 1
}

executar_freefire() {
clear
dd if="$HOME/P" bs=4M 2>/dev/null | adb shell \
"dd of='/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/gameassetbundles/shaders.zlljQr2O69fpqKa7ARyFycX4ejo~3D' bs=4M" \
>/dev/null 2>&1
sleep 1
}

instalar_opcao2() {
clear
dd if="$HOME/White" bs=4M 2>/dev/null | adb shell \
"dd of='/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/gameassetbundles/White' bs=4M" \
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

printf "%b" "
  https://discord.gg/injectbypass

  )       (     (          (
  ( /(       )\\ )  )\\ )       )\\ )
  )\\()) (   (()/( (()/(  (   (()/(
  |((_)\\  )\\   /(_)) /(_)) )\\   /(_))
  |_ ((_)((_) (_))  (_))  ((_) (_))
  | |/ / | __|| |   | |   | __|| _ \\
  ' <  | _| | |__ | |__ | _| |   /
  _|\\_\\ |___||____||____||___||_|_\\

${CYAN}  Coded By: Axx | Credits: Thx${NC}
"

printf "%b" "
${PURPLE}╔══════════════════════════╗
║      MENU PRINCIPAL      ║
╚══════════════════════════╝${NC}

${YELLOW}[0]${NC} Conectar ADB
${GREEN}[1]${NC} Bypass FreeFire Normal
${GREEN}[2]${NC} Inject WallHack White
${GREEN}[3]${NC} Inject WallHack 3D
${RED}[S]${NC} Sair
"

printf "%b" "${CYAN}  ▸ Escolha uma opção:${NC} "
read OP

case "$OP" in
0) parear_adb ;;
1) executar_freefire ;;
2) instalar_opcao2 ;;
3) instalar_opcao3 ;;
S|s) exit 0 ;;
*) sleep 1 ;;
esac
doneuB0nhM~3D" "/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.r3IRlJcuz81M6Fa~2FwxbbGuB0nhM~3D"
sleep 1
}

while true; do
clear
cat << EOF
  https://discord.gg/injectbypass

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

${YELLOW}[0]${NC} Conectar ADB
${GREEN}[1]${NC}Bypass FreeFire Normal
${GREEN}[2]${NC} Inject WallHack White
${GREEN}[3]${NC} Inject WallHack 3D
${RED}[S]${NC} Sair
EOF

echo -e "${CYAN}  ▸ Escolha uma opção:${NC}"
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
esac
doneone