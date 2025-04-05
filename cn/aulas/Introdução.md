# Redes de Computadores

## Introdução

A Internet é, hoje, a espinha dorsal da comunicação e da informação no mundo moderno. Ela conecta bilhões de dispositivos ao redor do planeta, permitindo o funcionamento de serviços como redes sociais, videoconferências, e-commerce, jogos online, e uma infinidade de aplicações.

Para entender como isso é possível, é essencial compreender os fundamentos das redes de computadores e os protocolos que permitem essa comunicação distribuída e coordenada.

### Objetivos da Aula

- **Compreender o que é a Internet:**  
  Discutir a Internet como um **serviço global de comunicação** e também como uma **infraestrutura complexa** formada por dispositivos interconectados.
- **Visão Geral do Funcionamento da Internet:**  
  Analisar como a comunicação ocorre entre sistemas, desde os **enlaces físicos** até os **protocolos de comunicação** que permitem a troca confiável de informações.

- **Organização da Internet:**  
  Apresentar os principais conceitos de **borda e núcleo da rede**, além da importância da **organização em camadas**, utilizando os modelos **OSI** e **TCP/IP** como referência.

---

### Explicação de Siglas e Conceitos-Chave

- **IP (Internet Protocol):**  
  Protocolo responsável pelo **endereçamento** e **roteamento** de pacotes de dados na rede. Cada dispositivo conectado à Internet possui um **endereço IP** único, que o identifica.

- **TCP (Transmission Control Protocol):**  
  Protocolo da camada de transporte que oferece **entrega confiável** de dados, garantindo que pacotes cheguem na ordem correta e sem perdas. É utilizado em serviços como navegação web (HTTP), email (SMTP) e muitos outros.

- **OSI (Open Systems Interconnection):**  
  Modelo teórico em **7 camadas**, criado pela ISO (International Organization for Standardization), que serve como uma referência para entender as funções da comunicação entre sistemas em rede.

- **TCP/IP (Transmission Control Protocol / Internet Protocol):**  
  Conjunto de protocolos utilizado na Internet real. É uma **implementação prática** baseada em 4 ou 5 camadas. Ele substitui o modelo OSI na maioria das redes reais.

- **LAN (Local Area Network):**  
  Rede local limitada a uma área geográfica pequena, como uma casa, escritório ou escola.

- **WAN (Wide Area Network):**  
   Rede de longa distância que interconecta diversas redes locais (LANs), podendo abranger cidades, países ou até o mundo todo.
  plorar a divisão entre borda e núcleo e a organização em camadas (modelos OSI e TCP/IP).

---

## O que é a Internet?

### Conceito e Definição

- **Serviço e Infraestrutura:**  
  A Internet é uma infraestrutura pública de comunicação que possibilita a execução de aplicações distribuídas, interligando bilhões de dispositivos (hospedeiros, sistemas finais ou hosts) que rodam aplicações diversas.
- **Aspectos Técnicos:**
  - **Enlaces de Comunicação:**  
    Incluem fibras ópticas, cabos (UTP, coaxial) e transmissões via rádio. A taxa de transmissão é definida pela largura de banda disponível.
  - **Roteadores e Protocolos:**  
    Dispositivos responsáveis por encaminhar pacotes entre redes, utilizando protocolos que definem o formato e a ordem das mensagens trocadas entre entidades comunicantes.

### Protocolos Fundamentais

- **TCP (Transmission Control Protocol):**  
  Garante a entrega confiável da informação (RFC 793 – 1981).
- **IP (Internet Protocol):**  
  Responsável pelo endereçamento, identificando cada host na rede (RFC 791 – 1981).

---

## . Redes de Computadores

### Definição

- Uma **rede de computadores** é um conjunto de módulos de processamento interconectados por um sistema de comunicação, com a finalidade de compartilhar recursos e informações.

### Classificação das Redes

- **LAN (Local Area Network):**  
  Redes locais que conectam dispositivos em uma área limitada, como um escritório ou residência.
- **WAN (Wide Area Network):**  
  Redes de longa distância que interligam diversas LANs, abrangendo grandes áreas geográficas.

---

## Organização e Arquitetura da Internet

### Composição da Internet

A Internet é formada por múltiplos componentes que colaboram para seu funcionamento:

- **Sistemas Finais e Aplicações:**  
  Dispositivos e softwares que interagem com os usuários.
- **Hardware e Software:**  
  Equipamentos (servidores, roteadores, switches) e programas que gerenciam as comunicações.
- **Enlaces Físicos:**  
  Infraestruturas que realizam a transmissão dos sinais (cabos, fibra, rádios).
- **Protocolos de Comunicação:**  
  Conjunto de regras que define como os dados são formatados, transmitidos e interpretados.

### Divisão em Borda e Núcleo

- **Borda:**  
  Onde estão localizados os usuários finais e as aplicações. É a parte complexa e heterogênea da rede.
- **Núcleo:**  
  Composto por roteadores e links de alta capacidade, apresenta uma estrutura simples e escalável.
- **Neutralidade da Rede:**  
  A ideia de que todos os pacotes devem ser tratados de forma igualitária, sem privilégios.

---

## Comutação de Pacotes e Atrasos na Comunicação

### Comutação de Pacotes

- **Definição:**  
  Técnica utilizada na Internet onde os recursos (enlaces de comunicação) são compartilhados entre múltiplas sessões. Os pacotes de dados são enviados de forma independente, o que pode ocasionar atrasos.

### Fatores que Influenciam a Latência

- **Processamento:**  
  Tempo que os roteadores levam para analisar e encaminhar os pacotes.
- **Fila (Queueing):**  
  Atraso decorrente do tempo de espera em filas para acesso ao enlace.
- **Transmissão:**  
  Tempo necessário para enviar os bits pelo meio físico.
- **Propagação:**  
  Tempo que o sinal leva para percorrer a distância entre os dispositivos.

_Exemplo:_  
O comando `traceroute` (em sistemas Unix) ou `tracert` (em Windows) pode ser utilizado para visualizar a rota dos pacotes e identificar possíveis gargalos ou atrasos.

```bash
# Exemplo de uso no Linux:
traceroute www.exemplo.com
```

---

## Organização em Camadas

### Vantagens da Organização em Camadas

- **Modularidade:**  
  Cada camada executa funções específicas e interage apenas com suas camadas adjacentes. Isso permite a alteração ou atualização de uma camada sem impactar as demais.
- **Isolamento:**  
  Facilita a identificação e correção de problemas, visto que cada camada é responsável por um conjunto específico de tarefas.

### Modelos de Referência

- **Modelo OSI:**  
  Um modelo teórico que define 7 camadas para a comunicação de dados.
- **Modelo TCP/IP:**  
  O modelo adotado na Internet, geralmente apresentado em 4 camadas (ou 5, se separarmos física e enlace).  
  A seguir, uma visão detalhada das camadas:

#### Camadas do Modelo TCP/IP

| **Camada**                                                                            | **Descrição**                                                                                                            | **Componentes/Funções**                                             |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| **Aplicação**                                                                         | Interação direta com o usuário e execução de aplicações (e.g., navegadores, clientes de email, redes sociais).           | Protocolos como HTTP, FTP, SMTP, DNS                                |
| **Transporte**                                                                        | Garante a comunicação confiável entre processos em dispositivos distintos.                                               | Protocolos TCP e UDP; gerenciamento de conexões e controle de fluxo |
| **Rede**                                                                              | Responsável pelo endereçamento e roteamento dos pacotes entre dispositivos localizados em redes distintas.               | Protocolo IP; roteadores; algoritmos de roteamento                  |
| **Enlace/Física**                                                                     | **Enlace:** Gerencia a comunicação entre dispositivos em uma mesma rede local (hardware como placas de rede e switches). |
| **Física:** Define a transmissão de bits através do meio físico (cabos, fibra, etc.). | Envolve dispositivos como switches, access points, conversores ópticos, cabos UTP, fibra óptica                          |

_Observação:_ Em algumas abordagens, as camadas de **Enlace** e **Física** são separadas para detalhar melhor os aspectos de hardware.

---

## Exemplos de Ferramentas e Comandos

- **Traceroute/Tracert:**  
  Permite rastrear a rota percorrida pelos pacotes até o destino, identificando cada nó (roteador) no caminho.
- **Netstat:**  
  Com o comando `netstat -a`, é possível visualizar as conexões ativas e estatísticas da camada de transporte.

```bash
# Exemplo de uso do netstat no terminal:
netstat -a
```

---
