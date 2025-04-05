# Máscara de Sub-rede (Subnet Mask)

## 🧩 O que é uma Sub-rede?

Uma **sub-rede** (subnet) é uma **divisão lógica de uma rede IP**. Ao dividir uma rede maior em sub-redes menores, é possível **organizar melhor os dispositivos**, **otimizar o tráfego de rede** e **melhorar a segurança**.

---

## 🧮 O que é uma Máscara de Sub-rede?

A **máscara de sub-rede** (subnet mask) é um número que define **quais bits do endereço IP representam a rede** e **quais representam os hosts**.

Ela atua como um "filtro" que separa o endereço IP em duas partes:

- **Parte da rede** (network)
- **Parte do host** (dispositivo específico)

### Exemplo:

| IP           | Máscara       | Resultado da separação        |
| ------------ | ------------- | ----------------------------- |
| 192.168.1.10 | 255.255.255.0 | Rede: 192.168.1.0 / Host: .10 |

---

## 🧠 Como funciona?

Máscaras de sub-rede são compostas por **32 bits**, assim como os endereços IPv4.

- Cada bit com valor `1` representa **parte da rede**
- Cada bit com valor `0` representa **parte do host**

### Exemplos comuns:

| CIDR | Máscara decimal | Bits de Rede | Bits de Host | Nº máximo de hosts |
| ---- | --------------- | ------------ | ------------ | ------------------ |
| /8   | 255.0.0.0       | 8            | 24           | 16.777.214         |
| /16  | 255.255.0.0     | 16           | 16           | 65.534             |
| /24  | 255.255.255.0   | 24           | 8            | 254                |
| /30  | 255.255.255.252 | 30           | 2            | 2                  |

> _A fórmula para calcular o número de hosts é: `2^n - 2`, onde `n` é o número de bits de host. Subtraímos 2 para excluir o endereço de rede e o de broadcast._

---

## 🧾 Notação CIDR

Ao invés de escrever a máscara em forma decimal, podemos usar a **notação CIDR (Classless Inter-Domain Routing)**:

- `192.168.0.1/24` → equivale a máscara `255.255.255.0`
- `10.0.0.1/8` → equivale a máscara `255.0.0.0`

Essa notação é **mais compacta** e muito usada em roteadores e configurações de rede.

---

## 🧪 Exemplo prático

Se você recebe do servidor DHCP:

- IP: `192.168.1.25`
- Máscara: `255.255.255.0`

Você está na sub-rede `192.168.1.0/24`, e os hosts válidos vão de `192.168.1.1` até `192.168.1.254`.

---

## 🧠 Por que usar sub-redes?

- Organizar diferentes setores de uma empresa em redes separadas
- Controlar o tráfego de broadcast
- Melhorar a segurança da rede (isolamento)
- Otimizar o uso de IPs públicos

---

## 📚 Referências

- [RFC 950 – Internet Standard Subnetting Procedure](https://datatracker.ietf.org/doc/html/rfc950)
- [Wikipedia – Subnetwork](https://en.wikipedia.org/wiki/Subnetwork)
- [Cisco – IP Subnetting](https://www.cisco.com/c/en/us/support/docs/ip/routing-information-protocol-rip/13788-3.html)

---

> Este material foi produzido de forma autônoma com base em fontes públicas e livres disponíveis na internet, com o objetivo de fins didáticos e educativos.
> ?
