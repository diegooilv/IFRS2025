# 🛰️ Camada de Rede

## 1. Visão Geral
A camada de rede é responsável por entregar pacotes de um host de origem para um host de destino, possivelmente através de múltiplas redes e roteadores intermediários. Enquanto a camada de enlace move quadros entre nós adjacentes, a camada de rede move pacotes **ponta a ponta**.

### 1.1. Funções Chave
- **Endereçamento Lógico:** Identifica cada host de forma única na rede global (Endereço IP).
- **Roteamento:** Determina o melhor caminho (rota) que os pacotes devem seguir da origem ao destino.
- **Encaminhamento (Forwarding):** Ação local do roteador de mover um pacote da entrada para a saída correta.

---

## 2. Modelos de Serviço de Rede

Existem duas abordagens principais para transportar pacotes na camada de rede:

### 2.1. Redes de Datagramas (Internet/IP)
- **Sem Conexão:** Não há fase de estabelecimento de conexão antes de enviar dados.
- **Independência:** Cada pacote é roteado independentemente. Pacotes da mesma mensagem podem seguir caminhos diferentes.
- **Best Effort:** Não garante entrega, ordem ou tempo.
- **Complexidade:** A inteligência está nas bordas (hosts); o núcleo é simples.

### 2.2. Redes de Circuitos Virtuais (ATM, Frame Relay)
- **Orientado a Conexão:** Caminho é estabelecido antes da transmissão (setup).
- **Estado:** Roteadores mantêm estado da conexão (tabelas de VC).
- **Caminho Fixo:** Todos os pacotes seguem o mesmo caminho.
- **Complexidade:** O núcleo da rede é complexo.

| Característica | Datagrama (IP) | Circuito Virtual |
| :--- | :--- | :--- |
| **Setup de Conexão** | Não | Sim |
| **Endereçamento** | IP Completo (Origem/Destino) | VC ID (Local) |
| **Roteamento** | Por pacote | No setup apenas |
| **Falha no Roteador** | Pacotes são rerroteados | Conexão cai |
| **QoS** | Difícil | Fácil |

---

## 3. O Protocolo IP (Internet Protocol)

O IP é o protocolo que une a Internet.
- **Versão 4 (IPv4):** Endereços de 32 bits. (Detalhado em [Ip.md](Ip.md))
- **Versão 6 (IPv6):** Endereços de 128 bits, sucessor do IPv4. (Detalhado em [Ipv6.md](Ipv6.md))

### 3.1. Fragmentação
Se um pacote IP for maior que o MTU (Maximum Transmission Unit) do enlace, ele deve ser fragmentado em pedaços menores e remontado apenas no destino final.

---

## 4. Plano de Dados vs. Plano de Controle

### 4.1. Plano de Dados (Data Plane)
- Funções locais em cada roteador.
- Determina como o datagrama que chega em uma porta de entrada é encaminhado para uma porta de saída.
- Baseado na **Tabela de Repasse (Forwarding Table)**.

### 4.2. Plano de Controle (Control Plane)
- Lógica de toda a rede.
- Determina como o datagrama é roteado fim-a-fim.
- Executa algoritmos de roteamento (OSPF, BGP) para preencher as tabelas de repasse. (Detalhado em [Roteamento.md](Roteamento.md))

---

## 5. ICMP (Internet Control Message Protocol)

Protocolo auxiliar usado por hosts e roteadores para comunicar informações de nível de rede.
- **Uso:** Relatório de erros (ex: "Destino inalcançável") e diagnósticos (ex: Ping, Traceroute).
- **Encapsulamento:** Mensagens ICMP viajam dentro de datagramas IP.

---

## 6. NAT (Network Address Translation)

Permite que uma rede local use um único endereço IP público para acessar a Internet.
- **Funcionamento:** O roteador NAT troca o (IP Privado, Porta) do host pelo (IP Público, Nova Porta) na saída e vice-versa na entrada.
- **Vantagem:** Economiza IPs públicos.
- **Desvantagem:** Quebra o princípio fim-a-fim; dificulta conexões P2P.

---

## 7. Referências
- **RFC 791:** Internet Protocol.
- **RFC 792:** ICMP.
