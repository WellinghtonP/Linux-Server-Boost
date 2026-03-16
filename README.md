# 🚀 Linux Performance Tuner

Script em **Bash** desenvolvido para **otimizar automaticamente parâmetros do kernel e limites do sistema Linux**, aumentando a capacidade de processamento e suportando workloads com **alta concorrência**.

Esse script é ideal para **servidores que lidam com grande volume de conexões e processos**, como:

* servidores web
* proxies reversos
* APIs de alta demanda
* servidores de download
* bancos de dados
* hosts de containers
* aplicações de alta performance

---

# ⚡ Funcionalidades

✔ Aumenta o limite de **arquivos abertos (ulimit)**
✔ Aumenta o limite de **processos do sistema**
✔ Otimiza o **stack de rede TCP**
✔ Ajusta parâmetros de **memória do kernel**
✔ Melhora o gerenciamento de **backlog de conexões**
✔ Configura limites padrão para **systemd**
✔ Preparado para ambientes de **alta concorrência**

---

# 🧠 O que o script otimiza

O script aplica ajustes automaticamente em diversos parâmetros importantes do sistema.

### Parâmetros do Kernel

* `fs.file-max`
* `net.core.somaxconn`
* `net.core.netdev_max_backlog`
* `net.ipv4.tcp_max_syn_backlog`
* `net.ipv4.ip_local_port_range`
* `vm.swappiness`
* `vm.dirty_ratio`
* `kernel.pid_max`

### Limites do Sistema

* `ulimit -n` (arquivos abertos)
* `ulimit -u` (processos)
* limites de processos
* limites de descritores de arquivos

### Limites do systemd

* `DefaultLimitNOFILE`
* `DefaultLimitNPROC`

---

# 📦 Instalação

Clone o repositório:

```bash
git clone https://github.com/seuusuario/linux-performance-tuner.git
cd linux-performance-tuner
```

Dê permissão de execução ao script:

```bash
chmod +x tune.sh
```

Execute como **root**:

```bash
sudo ./tune.sh
```

---

# 🔎 Verificando os limites após a execução

Verificar limites do sistema:

```bash
ulimit -a
```

Verificar parâmetros do kernel:

```bash
sysctl -a
```

---

# ⚠️ Requisitos

* Sistema Linux
* Permissão de **root**

Compatível com:

* Ubuntu
* Debian
* CentOS
* Rocky Linux
* AlmaLinux
* Arch Linux

---

# 📈 Casos de uso

Este script é especialmente útil para ambientes que lidam com:

* milhares de conexões simultâneas
* alto tráfego de rede
* grande número de arquivos abertos
* aplicações distribuídas
* workloads em containers

---

# 🛡️ Aviso

Este script altera **parâmetros do kernel e limites do sistema**.

Recomenda-se testar as configurações em **ambientes de teste ou staging** antes de aplicar em produção.

---

# 📜 Licença

MIT License

---

# 👨‍💻 Autor

Desenvolvido por **Wellinghton F. A. Pimenta**

Se este projeto te ajudou, considere deixar uma ⭐ no repositório.
