# 🔗 Camada de Enlace de Dados

## 1. Visão Geral
A camada de enlace (Data Link Layer) é responsável por transferir dados entre nós adjacentes na rede (conectados pelo mesmo meio físico). Ela transforma o canal de transmissão bruto da camada física em um link confiável para a camada de rede.

### 1.1. Serviços Principais
- **Enquadramento (Framing):** Encapsula o datagrama de rede em um quadro (frame), adicionando cabeçalho e trailer.
- **Endereçamento Físico (MAC):** Identifica a origem e o destino do quadro dentro da rede local.
- **Controle de Acesso ao Meio (MAC):** Regras para transmitir em meios compartilhados (ex: Wi-Fi, Ethernet antigo).
- **Detecção e Correção de Erros:** Identifica (e opcionalmente corrige) bits alterados pelo ruído (CRC, Paridade).

---

## 2. Subcamadas
A camada de enlace é frequentemente dividida em duas subcamadas (padrão IEEE 802):

1.  **LLC (Logical Link Control - 802.2):** Interface superior com a camada de rede. Gerencia controle de fluxo e erros.
2.  **MAC (Media Access Control):** Interface inferior com a camada física. Gerencia o acesso ao meio e endereçamento.

---

## 3. Endereçamento MAC

O endereço MAC (Media Access Control) é um identificador único de 48 bits (6 bytes) gravado no hardware (NIC).

- **Formato:** Hexadecimal, separado por dois pontos ou traços (ex: `00:1A:2B:3C:4D:5E`).
- **Estrutura:**
    - **OUI (Organizationally Unique Identifier):** Primeiros 3 bytes. Identifica o fabricante (atribuído pelo IEEE).
    - **NIC Specific:** Últimos 3 bytes. Número de série único do fabricante.

| Byte 1 | Byte 2 | Byte 3 | Byte 4 | Byte 5 | Byte 6 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| **OUI** | **OUI** | **OUI** | **NIC** | **NIC** | **NIC** |

- **Endereço de Broadcast:** `FF:FF:FF:FF:FF:FF` (todos os bits 1). Enviado para todos na LAN.

---

## 4. Protocolos de Acesso Múltiplo

Em meios compartilhados (barramento, wireless), é necessário coordenar quem fala para evitar colisões.

### 4.1. CSMA/CD (Carrier Sense Multiple Access / Collision Detection)
Usado em Ethernet cabeada (Half-Duplex).
1.  **Carrier Sense:** Escuta o meio antes de falar. Se livre, transmite.
2.  **Collision Detection:** Se detectar colisão enquanto transmite, para e envia sinal de reforço (jam).
3.  **Backoff Exponencial:** Espera um tempo aleatório antes de tentar novamente.

```mermaid
graph TD
    A[Início] --> B{Meio Livre?}
    B -- Não --> B
    B -- Sim --> C[Transmitir Quadro]
    C --> D{Colisão Detectada?}
    D -- Não --> E[Transmissão Concluída]
    D -- Sim --> F[Enviar Sinal de Jam]
    F --> G[Incrementar Tentativas]
    G --> H[Esperar Tempo Aleatório (Backoff)]
    H --> B
```

### 4.2. CSMA/CA (Carrier Sense Multiple Access / Collision Avoidance)
Usado em Wi-Fi (802.11), onde não é possível detectar colisões facilmente.
1.  **Collision Avoidance:** Tenta evitar colisões enviando um aviso prévio (RTS/CTS) ou esperando um tempo extra (DIFS) e usando ACKs para confirmar recebimento.

---

## 5. Ethernet (IEEE 802.3)

O padrão dominante para LANs cabeadas.

### 5.1. Estrutura do Quadro Ethernet
| Campo | Tamanho (Bytes) | Descrição |
| :--- | :--- | :--- |
| **Preâmbulo** | 7 | Sincronização (10101010...) |
| **SFD** | 1 | Start Frame Delimiter (10101011) |
| **Destino MAC** | 6 | Endereço de quem recebe |
| **Origem MAC** | 6 | Endereço de quem envia |
| **Tipo/Tam** | 2 | Protocolo superior (ex: 0x0800 para IPv4) ou tamanho |
| **Dados (Payload)** | 46 - 1500 | O pacote IP (com preenchimento se < 46 bytes) |
| **FCS (CRC)** | 4 | Frame Check Sequence (detecção de erro) |

---

## 6. Switches e VLANs

### 6.1. Switch (Comutador)
Dispositivo de camada 2 que encaminha quadros baseando-se no endereço MAC de destino.
- **Tabela MAC:** Aprende dinamicamente em qual porta está cada MAC (self-learning).
- **Domínio de Colisão:** Cada porta é um domínio de colisão isolado (Full-Duplex elimina colisões).
- **Domínio de Broadcast:** Por padrão, propaga broadcast para todas as portas.

### 6.2. VLAN (Virtual LAN - 802.1Q)
Divide um switch físico em várias redes lógicas.
- **Tagging:** Adiciona uma tag de 4 bytes ao quadro Ethernet para identificar a VLAN (ID 1-4094).
- **Benefícios:** Segurança, redução de domínio de broadcast, organização.

---

## 7. Referências
- **IEEE 802.3:** Ethernet.
- **IEEE 802.11:** Wireless LAN.
- **Metcalfe, R. M., & Boggs, D. R.:** "Ethernet: Distributed Packet Switching for Local Computer Networks".
