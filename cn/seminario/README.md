# 📡 Seminário – Protocolos e Programas

O seminário aconteceu com vários grupos apresentando programas e protocolos diferentes.

---

## **📚 Sumário**

- [📡 Seminário – Protocolos e Programas](#-seminário--protocolos-e-programas)
  - [**📚 Sumário**](#-sumário)
  - [✅ **FTP (File Transfer Protocol)**](#-ftp-file-transfer-protocol)
  - [✅ **SMB (Server Message Block)**](#-smb-server-message-block)
  - [✅ **NAS \& SAN**](#-nas--san)
  - [✅ **TeamViewer**](#-teamviewer)
  - [✅ **VNC (Virtual Network Computing)**](#-vnc-virtual-network-computing)
  - [✅ **RDP (Remote Desktop Protocol)**](#-rdp-remote-desktop-protocol)
  - [✅ **SSH (Secure Shell)**](#-ssh-secure-shell)
- [📊 **Tabelas Comparativas**](#-tabelas-comparativas)
    - [**Protocolo vs Porta**](#protocolo-vs-porta)
    - [**Open Source?**](#open-source)
    - [**Segurança**](#segurança)
  - [🔗 **Referências**](#-referências)

---

## ✅ **FTP (File Transfer Protocol)**

📌 **Camada:** Aplicação  
🔗 **Protocolo:** TCP  
🔑 **Porta padrão:** 21

**O que é?**  
Protocolo para **transferência de arquivos entre cliente e servidor**.

**Como funciona?**

- Duas conexões:
  - **Controle:** porta 21
  - **Dados:** porta dinâmica (ativo) ou definida (passivo)
- Funciona em dois modos: **Ativo** e **Passivo**

**Segurança:**  
❌ Sem criptografia  
✅ Alternativas: **FTPS**, **SFTP**

**Open Source?**  
✅ Existem implementações open source (vsftpd, FileZilla)

**Uso:**  
Upload/download em servidores, hospedagem de sites.

**📈 Diagrama de Funcionamento:**

```

[Cliente] ⇄ (Porta 21 - Controle) ⇄ \[Servidor FTP]
⇄ (Porta Dados) ⇄

```

---

## ✅ **SMB (Server Message Block)**

📌 **Camada:** Aplicação  
🔗 **Protocolo:** TCP  
🔑 **Porta padrão:** 445

**O que é?**  
Protocolo para **compartilhar arquivos, impressoras e recursos de rede**, usado principalmente em Windows.

**Como funciona?**

- Cliente envia comandos SMB para acessar pastas/arquivos no servidor.
- Suporte a autenticação (Active Directory).

**Segurança:**  
✅ SMB 3.x → criptografia nativa  
❌ SMB 1.x inseguro (responsável pelo WannaCry)

**Open Source?**  
❌ Protocolo proprietário da Microsoft  
✅ Implementação open source: **Samba**

**📈 Diagrama:**

```

[Cliente SMB] ⇄ (Porta 445) ⇄ \[Servidor SMB]

```

---

## ✅ **NAS & SAN**

- **NAS:** Armazenamento conectado à rede, acessado via SMB ou NFS.
- **SAN:** Rede dedicada para blocos de dados (iSCSI, Fibre Channel).

📌 **NAS** → fácil e barato  
📌 **SAN** → caro, alta performance

**📈 Diagrama (NAS):**

```

[Clientes] ⇄ \[Switch] ⇄ \[Servidor NAS]

```

---

## ✅ **TeamViewer**

📌 **Camada:** Aplicação  
🔑 **Portas:** TCP/UDP 5938, fallback 80/443  
❌ Proprietário

**Como funciona?**

- Acesso remoto via ID e senha
- Usa criptografia AES 256 + RSA 2048
- Depende de servidores TeamViewer

**📈 Diagrama:**

```

[Cliente] ⇄ \[Servidor TeamViewer] ⇄ \[Host Remoto]

```

---

## ✅ **VNC (Virtual Network Computing)**

📌 **Camada:** Aplicação  
🔑 **Porta padrão:** 5900  
✅ Open Source (TigerVNC, TightVNC)

**Como funciona?**

- Baseado no protocolo RFB (Remote Frame Buffer)
- Envia imagem da tela + recebe eventos de teclado/mouse

**Segurança:**  
❌ Sem criptografia nativa → usar túnel SSH

---

## ✅ **RDP (Remote Desktop Protocol)**

📌 **Camada:** Aplicação  
🔑 **Porta padrão:** 3389  
❌ Proprietário (Microsoft)

**Como funciona?**

- Acesso remoto com interface gráfica
- Criptografia padrão + compressão de dados

---

## ✅ **SSH (Secure Shell)**

📌 **Camada:** Aplicação  
🔑 **Porta padrão:** 22  
✅ Open Source (OpenSSH)

**Como funciona?**

- Acesso remoto seguro via terminal
- Autenticação por senha ou chave pública
- Criptografa todos os dados

---

# 📊 **Tabelas Comparativas**

### **Protocolo vs Porta**

| Protocolo  | Porta | Transporte |
| ---------- | ----- | ---------- |
| FTP        | 21    | TCP        |
| SMB        | 445   | TCP        |
| VNC        | 5900  | TCP        |
| RDP        | 3389  | TCP/UDP    |
| SSH        | 22    | TCP        |
| TeamViewer | 5938  | TCP/UDP    |

### **Open Source?**

| Protocolo  | Open Source               |
| ---------- | ------------------------- |
| FTP        | ✅ (vsftpd, FileZilla)    |
| SMB        | ❌ (Microsoft) – Samba ✅ |
| NAS/SAN    | Parcial                   |
| TeamViewer | ❌                        |
| VNC        | ✅                        |
| RDP        | ❌ (clientes open source) |
| SSH        | ✅                        |

### **Segurança**

| Protocolo | Criptografia  |
| --------- | ------------- |
| FTP       | ❌            |
| FTPS/SFTP | ✅            |
| SMBv3     | ✅            |
| VNC       | ❌ (usar SSH) |
| RDP       | ✅            |
| SSH       | ✅            |

---

## 🔗 **Referências**

- [RFC 959 – FTP Specification](https://www.rfc-editor.org/rfc/rfc959)
- [Microsoft Docs – SMB Protocol](https://learn.microsoft.com/en-us/windows-server/storage/file-server/file-server-smb-overview)
- [Red Hat – NAS vs SAN](https://www.redhat.com/en/topics/data-storage/nas-vs-san)
- [TeamViewer Official](https://www.teamviewer.com/)
- [RealVNC Docs](https://www.realvnc.com/en/connect/docs/)
- [Microsoft Docs – RDP](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients)
- [OpenSSH Official](https://www.openssh.com/)
