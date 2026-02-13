##!/bin/bash

IP=¨XXX.XXX.XXX.XXX¨ # CAMBIAR IP

# Colores
verde=$(tput setaf 2)
rojo=$(tput setaf 1)
amarillo=$(tput setaf 3)
azul=$(tput setaf 4)
reset=$(tput sgr0)

echo ""
echo "${azul}==============================================${reset}"
echo "${verde}   Ejecutando KATANA Preciso by Samurai Nmap  ${reset}"
echo "${azul}==============================================${reset}"
echo ""
echo "${amarillo}Iniciando...${reset}"
echo ""
sleep 5

# ------------------------
# CORTE 0
# Escaneo inicial con:
# - Scripts NSE por defecto (-sC)
# - Detección de versiones de servicios (-sV)
# - Detección del sistema operativo (-O)
# - Velocidad baja (T2) y verbose alto (-vvv)
# Resultado: corte0_preciso.txt
# ------------------------
sudo nmap -sC -sV -O -T2 -Pn -vvv -oN corte0_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 0 terminado${reset}"

# ------------------------
# CORTE 1
# Escaneo completo de todos los puertos (-p-),
# con scripts, versiones y SO.
# Resultado: corte1_preciso.txt
# ------------------------
sudo nmap -sC -sV -O -T2 -Pn -p- -vvv -oN corte1_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 1 terminado${reset}"

# ------------------------
# CORTE 2
# Descubrimiento de todos los puertos (-p-),
# sin scripts ni versiones. Más rápido y menos intrusivo.
# Resultado: corte2_preciso.txt
# ------------------------
sudo nmap -p- -T2 -Pn -vvv -oN corte2_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 2 terminado${reset}"

# ------------------------
# CORTE 3
# Escaneo TCP Connect (-sT) en todos los puertos,
# menos sigiloso pero más fiable en entornos donde
# el SYN Scan no funciona.
# Resultado: corte3_preciso.txt
# ------------------------
sudo nmap -sT -p- -T2 -Pn -vvv -oN corte3_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 3 terminado${reset}"

# ------------------------
# CORTE 4
# Scripts (-sC) y versiones (-sV),
# pero sin detección de SO (más liviano).
# Resultado: corte4_preciso.txt
# ------------------------
sudo nmap -sC -sV -T2 -Pn -vvv -oN corte4_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 4 terminado${reset}"

# ------------------------
# CORTE 5
# Escaneo de puertos UDP (-sU),
# detecta servicios como DNS, SNMP, NTP, etc.
# Resultado: corte5_preciso.txt
# ------------------------
sudo nmap -sU -T2 -Pn -vvv -oN corte5_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 5 terminado${reset}"

# ------------------------
# CORTE 6
# Escaneo con scripts NSE de la categoría "vuln",
# busca vulnerabilidades conocidas en servicios detectados.
# Resultado: corte6_preciso.txt
# ------------------------
sudo nmap --script vuln -T2 -Pn -vvv -oN corte6_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 6 terminado${reset}"

# ------------------------
# CORTE 7
# Escaneo ACK (-sA), útil para identificar
# si hay un firewall/IDS filtrando puertos.
# Resultado: corte7_preciso.txt
# ------------------------
sudo nmap -sA -T2 -Pn -vvv -oN corte7_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 7 terminado${reset}"

# ------------------------
# CORTE 8
# Escaneo con traceroute (--traceroute),
# muestra la ruta hacia el host (saltos de red).
# Resultado: corte8_preciso.txt
# ------------------------
sudo nmap --traceroute -T2 -Pn -vvv -oN corte8_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 8 terminado${reset}"

# ------------------------
# CORTE 9
# Scripts NSE de categoría "auth",
# orientados a probar métodos de autenticación
# sin explotación (ej: credenciales por defecto).
# Resultado: corte9_preciso.txt
# ------------------------
sudo nmap --script auth -T2 -Pn -vvv -oN corte9_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 9 terminado${reset}"

# ------------------------
# CORTE 10
# Scripts NSE de categoría "discovery",
# usados para enumerar servicios (SMB, HTTP, DNS).
# Resultado: corte10_preciso.txt
# ------------------------
sudo nmap --script discovery -T2 -Pn -vvv -oN corte10_preciso.txt $IP
sleep 5
echo "${verde}[OK] Corte numero 10 terminado${reset}"

echo ""
echo "${azul}==============================================${reset}"
echo "${verde}   Todos los cortes de KATANA Preciso han     ${reset}"
echo "${verde}   finalizado. Resultados en corteX_preciso.txt ${reset}"
echo "${azul}==============================================${reset}"
echo ""

