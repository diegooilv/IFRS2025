<style>
body {
  font-family: 'Segoe UI', Arial, sans-serif;
  background: #f8f9fa;
  color: #333;
  padding: 20px;
  line-height: 1.6;
}
h1, h2, h3 {
  color: #0d6efd;
  border-bottom: 2px solid #ddd;
  padding-bottom: 5px;
}
code {
  background: #f1f1f1;
  padding: 2px 5px;
  border-radius: 4px;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin: 15px 0;
}
table, th, td {
  border: 1px solid #ccc;
}
th {
  background: #0d6efd;
  color: white;
  text-align: left;
}
td {
  padding: 8px;
}
.highlight {
  background: #e9f7ef;
  border-left: 5px solid #28a745;
  padding: 10px;
  margin: 10px 0;
}
.alert {
  background: #f8d7da;
  border-left: 5px solid #dc3545;
  padding: 10px;
  margin: 10px 0;
}
.diagram {
  background: #fff3cd;
  padding: 10px;
  font-family: monospace;
  border-radius: 5px;
}
</style>

# 📡 Seminário – Protocolos e Programas

> O seminário aconteceu com vários grupos apresentando programas e protocolos diferentes.

---

## 📚 **Sumário**

- [📡 Seminário – Protocolos e Programas](#-seminário--protocolos-e-programas)
  - [📚 **Sumário**](#-sumário)
  - [✅ **FTP (File Transfer Protocol)**](#-ftp-file-transfer-protocol)
  - [✅ **SMB (Server Message Block)**](#-smb-server-message-block)
  - [✅ **NAS \& SAN**](#-nas--san)
  - [✅ **TeamViewer**](#-teamviewer)
  - [✅ **VNC (Virtual Network Computing)**](#-vnc-virtual-network-computing)
  - [✅ **RDP (Remote Desktop Protocol)**](#-rdp-remote-desktop-protocol)
  - [✅ **SSH (Secure Shell)**](#-ssh-secure-shell)
- [📊 **Tabelas Comparativas**](#-tabelas-comparativas)
    - [**Protocolo vs Porta**](#protocolo-vs-porta)
    - [**Open Source**](#open-source)
  - [🔗 **Referências**](#-referências)

---

## ✅ **FTP (File Transfer Protocol)**

<div class="highlight">
📌 Camada: Aplicação  
🔗 Protocolo: TCP  
🔑 Porta: 21  
✅ Open Source: Sim (vsftpd, FileZilla)
</div>

**Como funciona?**

- Duas conexões:
  - **Controle**: Porta 21
  - **Dados**: Porta dinâmica (modo ativo/passivo)

<div class="alert">⚠ Não criptografa dados! Use FTPS ou SFTP para segurança.</div>

**📈 Diagrama:**

<div class="diagram">
[Cliente] ⇄ (Porta 21) ⇄ [Servidor FTP]
          ⇄ (Porta Dados) ⇄
</div>

---

## ✅ **SMB (Server Message Block)**

<div class="highlight">
📌 Camada: Aplicação  
🔗 Protocolo: TCP  
🔑 Porta: 445  
✅ Implementação Open Source: Samba
</div>

**Como funciona?**

- Compartilha arquivos, impressoras e recursos em rede
- Integra com Active Directory

<div class="alert">⚠ SMBv1 é inseguro (usado no ataque WannaCry)</div>

**📈 Diagrama:**

<div class="diagram">
[Cliente SMB] ⇄ (Porta 445) ⇄ [Servidor SMB]
</div>

---

## ✅ **NAS & SAN**

- **NAS** → Armazenamento por arquivos (SMB/NFS)
- **SAN** → Armazenamento em blocos (iSCSI, Fibre Channel)

**📈 Diagrama NAS:**

<div class="diagram">
[Clientes] ⇄ [Switch] ⇄ [Servidor NAS]
</div>

---

## ✅ **TeamViewer**

<div class="highlight">
🔑 Portas: 5938 (TCP/UDP), fallback 80/443  
❌ Proprietário  
✅ Criptografia: AES 256 + RSA 2048
</div>

**📈 Diagrama:**

<div class="diagram">
[Cliente] ⇄ [Servidor TeamViewer] ⇄ [Host Remoto]
</div>

---

## ✅ **VNC (Virtual Network Computing)**

<div class="highlight">
📌 Porta: 5900  
✅ Open Source: Sim (TigerVNC, TightVNC)  
⚠ Sem criptografia nativa
</div>

**📈 Diagrama:**

<div class="diagram">
[Cliente VNC] ⇄ (Porta 5900) ⇄ [Servidor VNC]
</div>

---

## ✅ **RDP (Remote Desktop Protocol)**

<div class="highlight">
📌 Porta: 3389  
❌ Proprietário (Microsoft)  
✅ Criptografia nativa
</div>

---

## ✅ **SSH (Secure Shell)**

<div class="highlight">
📌 Porta: 22  
✅ Open Source: OpenSSH  
✅ Criptografia ponta a ponta
</div>

---

# 📊 **Tabelas Comparativas**

### **Protocolo vs Porta**

<table>
<tr><th>Protocolo</th><th>Porta</th><th>Transporte</th></tr>
<tr><td>FTP</td><td>21</td><td>TCP</td></tr>
<tr><td>SMB</td><td>445</td><td>TCP</td></tr>
<tr><td>VNC</td><td>5900</td><td>TCP</td></tr>
<tr><td>RDP</td><td>3389</td><td>TCP/UDP</td></tr>
<tr><td>SSH</td><td>22</td><td>TCP</td></tr>
<tr><td>TeamViewer</td><td>5938</td><td>TCP/UDP</td></tr>
</table>

### **Open Source**

<table>
<tr><th>Protocolo</th><th>Open Source?</th></tr>
<tr><td>FTP</td><td>✅ (vsftpd, FileZilla)</td></tr>
<tr><td>SMB</td><td>❌ (Microsoft) – Samba ✅</td></tr>
<tr><td>VNC</td><td>✅</td></tr>
<tr><td>RDP</td><td>❌ (clientes open source)</td></tr>
<tr><td>SSH</td><td>✅ (OpenSSH)</td></tr>
<tr><td>TeamViewer</td><td>❌</td></tr>
</table>

---

## 🔗 **Referências**

- [RFC 959 – FTP](https://www.rfc-editor.org/rfc/rfc959)
- [Microsoft Docs – SMB](https://learn.microsoft.com/en-us/windows-server/storage/file-server/file-server-smb-overview)
- [Red Hat – NAS vs SAN](https://www.redhat.com/en/topics/data-storage/nas-vs-san)
- [TeamViewer](https://www.teamviewer.com/)
- [RealVNC Docs](https://www.realvnc.com/en/connect/docs/)
- [Microsoft Docs – RDP](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients)
- [OpenSSH](https://www.openssh.com/)
