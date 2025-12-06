# 📦 Protocolo IP (Internet Protocol)

## 1. Visão Geral
O IP (RFC 791) é o protocolo de datagrama da camada de rede da Internet. Ele define o esquema de endereçamento e o formato dos pacotes. É um protocolo de **melhor esforço** (best effort), ou seja, não garante entrega.

---

## 2. Cabeçalho IPv4

O cabeçalho IPv4 tem tamanho variável (mínimo 20 bytes).

| Bit 0-3 | Bit 4-7 | Bit 8-15 | Bit 16-31 |
| :---: | :---: | :---: | :---: |
| **Versão** (4) | **IHL** (Tam. Cabeçalho) | **TOS** (Tipo de Serviço) | **Comprimento Total** (Bytes) |
| **Identificação** (16 bits) | | **Flags** (3 bits) | **Offset do Fragmento** (13 bits) |
| **TTL** (Time to Live) | **Protocolo** (TCP=6, UDP=17) | **Checksum do Cabeçalho** | |
| **Endereço IP de Origem** (32 bits) | | | |
| **Endereço IP de Destino** (32 bits) | | | |
| **Opções** (se IHL > 5) | | | **Padding** |

### 2.1. Campos Importantes
- **TTL:** Contador decrementado a cada roteador. Se chegar a 0, o pacote é descartado (evita loops infinitos).
- **Protocolo:** Indica qual protocolo da camada superior deve receber os dados (6=TCP, 17=UDP, 1=ICMP).
- **Checksum:** Verifica apenas a integridade do cabeçalho (não dos dados).

---

## 3. Endereçamento IPv4

Um endereço IPv4 tem 32 bits, geralmente representado em notação decimal pontuada (ex: `192.168.1.1`).

### 3.1. Classes de Endereços (Histórico)
Originalmente, os IPs eram divididos em classes fixas:
- **Classe A:** `0.0.0.0` - `127.255.255.255` (/8) - Grandes redes.
- **Classe B:** `128.0.0.0` - `191.255.255.255` (/16) - Redes médias.
- **Classe C:** `192.0.0.0` - `223.255.255.255` (/24) - Pequenas redes.
- **Classe D:** Multicast.
- **Classe E:** Experimental.

*Hoje, utiliza-se CIDR (Classless Inter-Domain Routing) em vez de classes fixas.*

### 3.2. Endereços Especiais
- **Loopback:** `127.0.0.0/8` (ex: `127.0.0.1` - localhost).
- **Privados (RFC 1918):** Não roteáveis na Internet pública.
    - `10.0.0.0/8`
    - `172.16.0.0/12`
    - `192.168.0.0/16`

---

## 4. Fragmentação e Remontagem

Se um datagrama for maior que o MTU (Maximum Transmission Unit) do enlace (ex: Ethernet = 1500 bytes), ele deve ser fragmentado.
- **Identificação:** Identifica a qual datagrama original os fragmentos pertencem.
- **Flags:** Bit "More Fragments" indica se há mais pedaços.
- **Offset:** Indica a posição dos dados deste fragmento no datagrama original.
- **Remontagem:** Ocorre **apenas no destino final**, para não sobrecarregar roteadores intermediários.

---

## 5. Referências
- **RFC 791:** Internet Protocol.
