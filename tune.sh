#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Execute como root."
  exit 1
fi

echo "[+] Aplicando otimizações de kernel e limites..."

SYSCTL_CONF="/etc/sysctl.d/99-performance.conf"
LIMITS_CONF="/etc/security/limits.d/99-performance.conf"

cat > $SYSCTL_CONF <<EOF

# Max file descriptors
fs.file-max = 2097152

# Network tuning
net.core.somaxconn = 65535
net.core.netdev_max_backlog = 262144
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864

# TCP tuning
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_fin_timeout = 15

# Port range
net.ipv4.ip_local_port_range = 1024 65535

# TIME_WAIT reuse
net.ipv4.tcp_tw_reuse = 1

# VM tuning
vm.swappiness = 10
vm.dirty_ratio = 15
vm.dirty_background_ratio = 5

# Kernel PID max
kernel.pid_max = 4194303

EOF


echo "[+] Aplicando limites de usuários..."

cat > $LIMITS_CONF <<EOF

* soft nofile 1048576
* hard nofile 1048576

* soft nproc 1048576
* hard nproc 1048576

* soft memlock unlimited
* hard memlock unlimited

root soft nofile 1048576
root hard nofile 1048576

root soft nproc 1048576
root hard nproc 1048576

EOF


echo "[+] Aplicando configurações..."

sysctl --system


echo "[+] Ajustando limite global de arquivos..."

echo "fs.nr_open=1048576" >> /etc/sysctl.conf


echo "[+] Ajustando limite para systemd..."

mkdir -p /etc/systemd/system.conf.d

cat > /etc/systemd/system.conf.d/limits.conf <<EOF
[Manager]
DefaultLimitNOFILE=1048576
DefaultLimitNPROC=1048576
EOF


echo "[+] Reiniciando daemon do systemd..."

systemctl daemon-reexec


echo "[+] Configuração aplicada com sucesso."
echo "Recomenda-se reiniciar o sistema."