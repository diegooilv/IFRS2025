# 🧩 Camada de Aplicação

## 1. Visão Geral
A camada de aplicação é o topo da pilha de protocolos da Internet. É onde residem as aplicações de rede e seus protocolos. Diferente das outras camadas, que fornecem serviços para a camada superior, a camada de aplicação fornece serviços diretamente para o software do usuário ou para o sistema operacional.

### 1.1. Interação
Os protocolos de aplicação definem:
- Tipos de mensagens (requisição, resposta).
- Sintaxe das mensagens (campos e formatos).
- Semântica dos campos (significado da informação).
- Regras de quando e como enviar/responder mensagens.

---

## 2. Arquiteturas de Aplicação

Como a aplicação é estruturada nos hosts?

### 2.1. Cliente-Servidor (Client-Server)
- **Servidor:** Host sempre ligado, endereço IP permanente, data centers para escala.
- **Cliente:** Comunica-se com o servidor, pode ter IP dinâmico, não se comunica diretamente com outros clientes.
- **Exemplos:** Web (HTTP), Email (IMAP/SMTP), FTP.

### 2.2. Peer-to-Peer (P2P)
- **Peers:** Hosts arbitrários (computadores pessoais) que se comunicam diretamente.
- **Escalabilidade:** Auto-escalável (novos peers trazem nova capacidade de serviço).
- **Desafios:** Gerenciamento complexo, segurança, IPs dinâmicos.
- **Exemplos:** BitTorrent, Skype (híbrido antigo), Blockchain.

| Característica | Cliente-Servidor | P2P |
| :--- | :--- | :--- |
| **Dependência** | Depende do servidor central | Depende dos pares |
| **Custo** | Alto custo de servidor/banda no centro | Custo distribuído |
| **Complexidade** | Simples no cliente | Complexo (cliente também é servidor) |

---

## 3. Requisitos de Transporte das Aplicações

Diferentes aplicações precisam de diferentes serviços da camada de transporte.

| Aplicação | Perda de Dados | Vazão (Throughput) | Sensibilidade a Tempo | Protocolo Típico |
| :--- | :--- | :--- | :--- | :--- |
| **Transferência de Arquivo** | Não tolera | Elástica | Baixa | TCP |
| **E-mail** | Não tolera | Elástica | Baixa | TCP |
| **Web** | Não tolera | Elástica | Média | TCP |
| **Áudio/Vídeo em Tempo Real** | Tolera | Requer mínimo | Alta (ms) | UDP |
| **Jogos Interativos** | Tolera | Baixa | Alta (ms) | UDP |

---

## 4. Principais Protocolos de Aplicação

### 4.1. Web e Navegação
- **HTTP/HTTPS:** Transferência de hipertexto. (Veja [Http.md](Http.md) e [Https.md](Https.md))

### 4.2. Correio Eletrônico
- **SMTP (Simple Mail Transfer Protocol):** Envio de email (push).
- **POP3 (Post Office Protocol):** Recebimento (download e delete).
- **IMAP (Internet Message Access Protocol):** Acesso e gerenciamento no servidor.

### 4.3. Infraestrutura
- **DNS (Domain Name System):** Tradução de nomes para IPs. (Veja [Dns.md](Dns.md))
- **DHCP (Dynamic Host Configuration Protocol):** Configuração automática de hosts. (Veja [Dhcp.md](Dhcp.md))

### 4.4. Acesso Remoto e Arquivos
- **SSH (Secure Shell):** Acesso remoto seguro (substitui Telnet).
- **FTP (File Transfer Protocol):** Transferência de arquivos.

---

## 5. Referências
- **RFC 2616:** HTTP/1.1.
- **RFC 5321:** SMTP.
