# 🛡️ Segurança de Redes

## 1. Visão Geral
A segurança de redes protege a integridade, confidencialidade e disponibilidade dos dados e recursos da rede.

### 1.1. A Tríade CIA
- **Confidencialidade:** Garantir que apenas pessoas autorizadas leiam os dados (Criptografia).
- **Integridade:** Garantir que os dados não foram alterados (Hash/Assinatura).
- **Disponibilidade:** Garantir que o serviço esteja acessível quando necessário (Proteção contra DDoS).

---

## 2. Criptografia

### 2.1. Simétrica (Chave Privada)
- A mesma chave é usada para encriptar e decriptar.
- **Vantagem:** Rápida.
- **Desvantagem:** Como compartilhar a chave seguramente?
- **Exemplos:** AES (Advanced Encryption Standard), DES (obsoleto).

### 2.2. Assimétrica (Chave Pública)
- Par de chaves: Pública (encripta) e Privada (decripta).
- **Vantagem:** Resolve o problema da troca de chaves.
- **Desvantagem:** Lenta.
- **Exemplos:** RSA, Curvas Elípticas (ECC).

*Na prática (ex: HTTPS/TLS), usa-se assimétrica para trocar a chave simétrica, e depois usa-se simétrica para os dados.*

---

## 3. Defesa de Rede

### 3.1. Firewall
Dispositivo que filtra o tráfego de rede com base em regras de segurança.
- **Stateless:** Filtra pacote por pacote (olha IP/Porta).
- **Stateful:** Entende o contexto da conexão (sabe se o pacote é resposta de um pedido interno).
- **Next-Gen (NGFW):** Inspeção profunda de pacotes (DPI), filtro de aplicação.

### 3.2. IDS / IPS
- **IDS (Intrusion Detection System):** Monitora e alerta sobre atividades suspeitas (passivo).
- **IPS (Intrusion Prevention System):** Monitora e bloqueia ataques em tempo real (ativo).

### 3.3. VPN (Virtual Private Network)
Cria um túnel criptografado sobre uma rede pública (Internet), permitindo acesso seguro a recursos internos.
- **Protocolos:** IPsec, OpenVPN, WireGuard.

---

## 4. Tipos de Ataques Comuns
- **DDoS (Distributed Denial of Service):** Sobrecarga o servidor com tráfego falso para tirá-lo do ar.
- **Man-in-the-Middle (MitM):** Atacante intercepta a comunicação entre duas partes.
- **Phishing:** Engenharia social para roubar credenciais.

---

## 5. Referências
- **NIST:** Computer Security Resource Center.
