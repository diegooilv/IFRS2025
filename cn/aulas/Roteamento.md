# 🛣️ Roteamento (Routing)

## 1. Visão Geral
O roteamento é o processo de selecionar o melhor caminho em uma rede para enviar pacotes da origem ao destino. É a função principal da Camada de Rede (Plano de Controle).

---

## 2. Tipos de Roteamento

### 2.1. Roteamento Estático
- **Definição:** As rotas são configuradas manualmente pelo administrador.
- **Vantagens:** Simples em redes pequenas, seguro, sem overhead de CPU.
- **Desvantagens:** Não escala, não se adapta a falhas automaticamente.

### 2.2. Roteamento Dinâmico
- **Definição:** Os roteadores trocam informações entre si e calculam as rotas automaticamente.
- **Vantagens:** Escalável, tolerante a falhas (recalcula rotas se um link cair).
- **Desvantagens:** Consome CPU e banda, mais complexo.

---

## 3. Classificação dos Protocolos Dinâmicos

### 3.1. Interior Gateway Protocols (IGP)
Usados **dentro** de um Sistema Autônomo (AS) - ex: rede de uma empresa ou ISP.

#### Distance Vector (Vetor de Distância)
- **Algoritmo:** Bellman-Ford.
- **Conceito:** Cada roteador conta aos vizinhos o que sabe ("Eu alcanço a rede X em 3 saltos").
- **Exemplo:** **RIP (Routing Information Protocol)**.
    - Métrica: Contagem de saltos (máx 15).
    - Convergência lenta (problema da contagem ao infinito).

#### Link State (Estado de Enlace)
- **Algoritmo:** Dijkstra (Shortest Path First).
- **Conceito:** Cada roteador mapeia toda a topologia da rede (inunda o estado dos seus links) e calcula o caminho mais curto.
- **Exemplo:** **OSPF (Open Shortest Path First)**.
    - Métrica: Custo (baseado na banda).
    - Convergência rápida, suporta redes grandes (áreas).

### 3.2. Exterior Gateway Protocols (EGP)
Usados **entre** Sistemas Autônomos (AS) - ex: entre ISPs.

#### Path Vector (Vetor de Caminho)
- **Conceito:** Anuncia o caminho completo (lista de ASs) para evitar loops.
- **Exemplo:** **BGP (Border Gateway Protocol)**.
    - O protocolo que faz a Internet funcionar.
    - Baseado em políticas (política > técnica).

---

## 4. Tabela de Roteamento
Cada roteador mantém uma tabela com:
- **Rede de Destino:** (ex: 192.168.1.0/24)
- **Próximo Salto (Next Hop):** (ex: 10.0.0.1)
- **Interface de Saída:** (ex: eth0)
- **Métrica:** Custo para chegar lá.

*Regra de Ouro:* O roteador sempre escolhe a rota com a **máscara mais específica** (Longest Prefix Match).

---

## 5. Referências
- **RFC 2328:** OSPF Version 2.
- **RFC 4271:** BGP-4.
