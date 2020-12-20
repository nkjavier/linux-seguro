#!/bin/bash
# Demo-menu shell script
## ----------------------------------
# Define variables
# ----------------------------------

aa1(){
 echo "instalando Escenciales en Distros Debian"
 sudo apt install clamav clamtk rkhunter chkrootkit ufw fail2ban
 sudo ufw disable
sudo ufw reset
sudo ufw limit 22/tcp  
sudo ufw allow 80/tcp  
sudo ufw allow 443/tcp  
sudo ufw default deny incoming  
sudo ufw default allow outgoing
sudo ufw enable
sudo cp fail2ban.local /etc/fail2ban/
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo netstat -tunlp
# --- Harden /etc/sysctl.conf
sudo sysctl kernel.modules_disabled=1
sudo sysctl -a
sudo sysctl -A
sudo sysctl mib
sudo sysctl net.ipv4.conf.all.rp_filter
sudo sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'
        pause
}
 
# do something in two()
aa2(){
 echo "instalando Escenciales en Distros Fedora"
  sudo dnf install clamav clamtk rkhunter chkrootkit ufw fail2ban
  sudo ufw disable
sudo ufw reset
sudo ufw limit 22/tcp  
sudo ufw allow 80/tcp  
sudo ufw allow 443/tcp  
sudo ufw default deny incoming  
sudo ufw default allow outgoing
sudo ufw enable
sudo cp fail2ban.local /etc/fail2ban/
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo netstat -tunlp
# --- Harden /etc/sysctl.conf
sudo sysctl kernel.modules_disabled=1
sudo sysctl -a
sudo sysctl -A
sudo sysctl mib
sudo sysctl net.ipv4.conf.all.rp_filter
sudo sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'
                pause
}


aa4(){
 echo "Actualizando"
 echo "Bajando el Servicio Antivirus"
sudo systemctl stop clamav-freshclam.service
clear
echo "Actualizando Anivirus"
echo "##############"
sudo freshclam
clear
echo "Actualizando Rkhunter"
echo "##############"
sudo rkhunter --update
echo "Arriba el servicio de Antivirus"
sudo systemctl start clamav-freshclam.service
sleep 10s
                pause
}

aa5(){
 echo "Actualizando Anivirus"
 sudo systemctl stop clamav-freshclam.service
 sudo freshclam
 sudo systemctl start clamav-freshclam.service
 pause
}

aa6(){
echo "Actualizando Rkhunter"
echo "##############"
sudo rkhunter --update
pause
}

aa7(){
echo "Iniciando Scan desde / "
sudo clamscan -r -i /
echo "Terminado"
pause
}


aa8(){
 echo "Rkhunter Diagnostico"
sudo rkhunter --check --sk
                pause
}

aa9(){
 echo "chkroot Diagnostico"
  sudo chkrootkit
                pause
}

aa0(){
 echo "Copiando Rkhunter.conf a /etc"
sudo cp rkhunter.conf /etc
                pause
}

# function to display menus
show_menus() {
 clear
 echo "~~~~~~~~~~~~~~~~~~~~~" 
 echo "  MENU Principal -V.1.0  "
 echo "~~~~~~~~~~~~~~~~~~~~~"
 echo "1. Instalar prev. Esenciales - Distros Debian"
 echo "2. Instalar prev. Esenciales - Distros Fedora"
 echo "4. Actualizar Todo: Antivirus + Rkhunter"
 echo "5. Actualizar solo Cleamav"
 echo "6. Actualizar solo rkhunter"
 echo "7. CleamAv Scan todo el disco"
 echo "8. Iniciar Rkhunter Diagnostico"
 echo "9. Iniciar Chkrootkit basico"
 echo "0. copiar Conf Rkhunter a la pc"
 echo "3. Exit"
}
# Lee la accion sobre el teclado y la ejecuta.
# Invoca el () cuando el usuario selecciona 1 en el menú.
# Invoca a los dos () cuando el usuario selecciona 2 en el menú.
# Salir del menu cuando el usuario selecciona 3 en el menú.
read_options(){
 local choice
 read -p "Enter choice [ 1 - 9] " choice
 case $choice in
  1) aa1 ;;
  2) aa2 ;;
  4) aa4 ;;
  5) aa5 ;;
  6) aa6 ;;
  7) aa7 ;;
  8) aa8 ;;
  9) aa9 ;;
  0) aa0 ;;
  3) exit 0;;
  *) echo -e "${RED}Error...${STD}" && sleep 2
 esac
}
 
# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Main logic - infinite loop
# ------------------------------------
while true
do
 
 show_menus
 read_options
done

