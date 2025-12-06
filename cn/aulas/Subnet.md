# 🧮 Subnet e Máscaras de Rede

## 1. Visão Geral
A máscara de sub-rede (Subnet Mask) define qual parte de um endereço IP corresponde à **rede** e qual parte corresponde ao **host**. Isso permite dividir uma rede grande em redes menores (sub-redes).

---

## 2. Notação CIDR (Classless Inter-Domain Routing)

A notação CIDR (ex: `/24`) indica o número de bits "1" na máscara.

| Notação CIDR | Máscara Decimal | Hosts Úteis |
| :---: | :---: | :---: |
| `/8` | `255.0.0.0` | 16.777.214 |
| `/16` | `255.255.0.0` | 65.534 |
| `/24` | `255.255.255.0` | 254 |
| `/25` | `255.255.255.128` | 126 |
| `/30` | `255.255.255.252` | 2 (Ponto a Ponto) |

---

## 3. Cálculo de Sub-rede (Exemplo Prático)

Dado o IP `192.168.10.50` e a máscara `/24` (`255.255.255.0`).

### 3.1. Operação E Lógico (AND)
Para achar o endereço de rede, fazemos um AND bit a bit entre o IP e a Máscara.

```
IP:      11000000.10101000.00001010.00110010 (192.168.10.50)
Máscara: 11111111.11111111.11111111.00000000 (255.255.255.0)
------------------------------------------------------------
Rede:    11000000.10101000.00001010.00000000 (192.168.10.0)
```

### 3.2. Endereço de Broadcast
É o endereço onde a parte de host é toda "1".
- Rede: `192.168.10.0`
- Broadcast: `192.168.10.255`

### 3.3. Faixa de Hosts Úteis
Do primeiro IP após a rede até o último antes do broadcast.
- `192.168.10.1` a `192.168.10.254`

---

## 4. VLSM (Variable Length Subnet Mask)
Permite usar máscaras de tamanhos diferentes na mesma rede principal, otimizando o uso de IPs.
- Exemplo: Usar `/30` para links entre roteadores (2 hosts) e `/24` para LANs de usuários.

---

## 5. Ferramentas
- **Calculadoras de IP:** `ipcalc` (Linux), sites online.
- **Fórmula de Hosts:** $2^h - 2$ (onde $h$ é o número de bits de host).
