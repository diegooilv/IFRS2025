# 📨 UDP (User Datagram Protocol)

## 1. Visão Geral
O UDP (RFC 768) é um protocolo de transporte simples, sem conexão e não confiável. Ele fornece apenas o mínimo necessário para multiplexação/demultiplexação e verificação de erros básica.

---

## 2. Estrutura do Datagrama UDP

O cabeçalho UDP é extremamente leve, com apenas 8 bytes.

| Bit 0-15 | Bit 16-31 |
| :---: | :---: |
| **Porta de Origem** | **Porta de Destino** |
| **Comprimento** (Cabeçalho + Dados) | **Checksum** |

---

## 3. Características Principais

### 3.1. Sem Conexão (Connectionless)
- Não há handshake antes de enviar dados.
- Não mantém estado da conexão no servidor.
- Suporta broadcast e multicast (o TCP é apenas unicast).

### 3.2. Não Confiável (Unreliable)
- Não garante entrega (pacotes podem ser perdidos).
- Não garante ordem (pacotes podem chegar fora de ordem).
- Não tem controle de fluxo ou congestionamento. O transmissor pode inundar o receptor ou a rede.

---

## 4. Por que usar UDP?

Apesar das limitações, o UDP é preferido em muitos cenários:

1.  **Velocidade:** Sem overhead de handshake (RTT inicial zero).
2.  **Tempo Real:** Aplicações como voz (VoIP) e vídeo preferem perder alguns quadros a ter atraso (jitter) causado por retransmissões do TCP.
3.  **Simplicidade:** O servidor pode atender mais clientes pois não mantém estado.
4.  **Cabeçalho Pequeno:** 8 bytes vs 20 bytes do TCP.

### 4.1. Exemplos de Uso
- **DNS:** Consultas rápidas (request/response único).
- **Streaming de Mídia:** YouTube (QUIC/UDP), Netflix.
- **Jogos Online:** Posição de jogadores (atualizações frequentes, perder uma não é crítico).
- **DHCP:** Descoberta de rede.

---

## 5. Referências
- **RFC 768:** User Datagram Protocol.
