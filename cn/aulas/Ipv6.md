# 🚀 IPv6 (Internet Protocol version 6)

## 1. Visão Geral
O IPv6 (RFC 8200) é o sucessor do IPv4, projetado para resolver o esgotamento de endereços IP. Ele oferece um espaço de endereçamento vastamente maior e melhorias na eficiência do cabeçalho.

---

## 2. Diferenças Principais: IPv4 vs IPv6

| Característica | IPv4 | IPv6 |
| :--- | :--- | :--- |
| **Tamanho do Endereço** | 32 bits (4 bytes) | 128 bits (16 bytes) |
| **Espaço de Endereçamento** | ~4.3 bilhões ($2^{32}$) | Indecifrável ($2^{128}$) |
| **Notação** | Decimal (192.168.1.1) | Hexadecimal (2001:db8::1) |
| **Cabeçalho** | Tamanho variável (20+ bytes) | Tamanho fixo (40 bytes) |
| **Fragmentação** | Roteadores e Hosts | Apenas Hosts (Origem) |
| **Checksum** | Sim | Não (confia na camada 2 e 4) |
| **Configuração** | DHCP ou Manual | SLAAC (Stateless) ou DHCPv6 |

---

## 3. Formato do Endereço IPv6

`2001:0db8:85a3:0000:0000:8a2e:0370:7334`

- 8 grupos de 4 dígitos hexadecimais, separados por `:`.
- **Simplificação:**
    - Zeros à esquerda podem ser omitidos (`0db8` -> `db8`).
    - Uma sequência de grupos de zeros pode ser substituída por `::` (uma vez apenas).
    - Ex: `2001:db8:85a3::8a2e:370:7334`.

---

## 4. Tipos de Endereço
- **Unicast:** Um para um (Global Unicast, Link-Local `fe80::`).
- **Multicast:** Um para muitos (`ff00::`). Substitui o Broadcast.
- **Anycast:** Um para o mais próximo (mesmo IP em vários servidores).

---

## 5. Transição e Coexistência

Como migrar a Internet inteira sem desligar?

### 5.1. Pilha Dupla (Dual Stack)
Os dispositivos rodam IPv4 e IPv6 simultaneamente. É a estratégia preferida.

### 5.2. Tunelamento (Tunneling)
Encapsula pacotes IPv6 dentro de pacotes IPv4 para atravessar ilhas IPv4. (Ex: 6to4, Teredo).

### 5.3. Tradução (NAT64)
Permite que dispositivos apenas IPv6 falem com servidores apenas IPv4.

---

## 6. Referências
- **RFC 8200:** Internet Protocol, Version 6 (IPv6) Specification.
