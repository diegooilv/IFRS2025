# 🚚 Camada de Transporte

## 1. Visão Geral
A camada de transporte fornece **comunicação lógica** entre processos de aplicação rodando em hosts diferentes. Enquanto a camada de rede conecta hosts, a camada de transporte conecta processos.

### 1.1. Responsabilidades
- **Multiplexação/Demultiplexação:** Entregar os dados recebidos da rede para o processo correto (via portas).
- **Verificação de Integridade:** Garantir que os dados não foram corrompidos (Checksum).
- **Confiabilidade (TCP):** Garantir entrega, ordem e controle de fluxo.

---

## 2. Multiplexação e Demultiplexação

Como um host lida com múltiplos processos de rede simultâneos?

- **Sockets:** Portas de comunicação entre aplicação e transporte.
- **Portas:** Identificadores numéricos de 16 bits (0-65535).
    - **Bem conhecidas (0-1023):** Reservadas para serviços padrão (HTTP=80, SSH=22).
    - **Registradas (1024-49151):** Usadas por aplicações de usuário.
    - **Dinâmicas/Privadas (49152-65535):** Atribuídas temporariamente a clientes.

### 2.1. Diagrama de Demultiplexação

```mermaid
graph TD
    subgraph Host_Receptor
        IP[Camada de Rede (IP)] -->|Segmento TCP| TCP[Camada de Transporte]
        TCP -->|Porta 80| P1[Processo Servidor Web]
        TCP -->|Porta 22| P2[Processo SSH]
        TCP -->|Porta 25| P3[Processo Email]
    end
```

---

## 3. Protocolos de Transporte da Internet

### 3.1. UDP (User Datagram Protocol)
- **Características:** Não orientado a conexão, não confiável, leve.
- **Serviço:** "Best effort". Pode perder, duplicar ou desordenar pacotes.
- **Uso:** Streaming, jogos online, DNS, VoIP.
- **Detalhes:** Veja [Udp.md](Udp.md).

### 3.2. TCP (Transmission Control Protocol)
- **Características:** Orientado a conexão, confiável, pesado.
- **Serviço:** Garante entrega, ordem, controle de fluxo e controle de congestionamento.
- **Uso:** Web (HTTP), Email (SMTP), Transferência de Arquivos (FTP).
- **Detalhes:** Veja [Tcp.md](Tcp.md).

| Característica | UDP | TCP |
| :--- | :--- | :--- |
| **Conexão** | Não | Sim (Handshake) |
| **Confiabilidade** | Não | Sim (ACKs, Retransmissão) |
| **Ordem** | Não garantida | Garantida |
| **Controle de Fluxo** | Não | Sim (Janela Deslizante) |
| **Overhead** | Baixo (8 bytes header) | Alto (20 bytes header) |

---

## 4. Princípios de Transferência Confiável de Dados (RDT)

Como criar um canal confiável sobre um canal não confiável (como o IP)?

1.  **Checksum:** Para detectar erros nos bits.
2.  **ACK (Acknowledgment):** Receptor avisa que recebeu ok.
3.  **NACK (Negative Acknowledgment):** Receptor avisa que houve erro (ou usa-se timeout se o ACK não chegar).
4.  **Temporizador (Timer):** Transmissor reenvia se não receber ACK após um tempo (para lidar com perda de pacotes).
5.  **Números de Sequência:** Para detectar duplicatas e ordenar pacotes.

### 4.1. Pipeline (Pipelining)
Para melhorar a eficiência, não esperamos um ACK para enviar o próximo pacote. Enviamos vários.
- **Go-Back-N:** Transmissor pode ter até N pacotes não confirmados. Se der erro, retransmite tudo a partir do erro.
- **Selective Repeat:** Retransmite apenas o pacote que falhou.

---

## 5. Referências
- **RFC 768:** UDP.
- **RFC 793:** TCP.
