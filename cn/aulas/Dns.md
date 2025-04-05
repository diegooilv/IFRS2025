# Domain Name System (DNS)

## Introdução

O **DNS (Domain Name System)** é um sistema essencial para o funcionamento da Internet, atuando como uma **agenda pública descentralizada** que traduz nomes de domínio (como `google.com`) em **endereços IP** (como `142.250.78.14`), permitindo que usuários acessem sites e serviços sem precisar memorizar números.

Assim como uma lista de contatos que associa nomes a números de telefone, o DNS associa **nomes amigáveis a endereços numéricos**, funcionando como o “sistema de nomes da Internet”.

---

## Por que o DNS é necessário?

Os computadores e dispositivos se comunicam por meio de **endereços IP**, mas esses não são práticos para seres humanos. O DNS resolve essa dificuldade:

- Nome compreensível → `www.exemplo.com`
- IP correspondente → `192.0.2.1`

Essa **resolução de nomes** acontece automaticamente cada vez que você acessa um site, envia um e-mail ou utiliza qualquer serviço de rede.

---

## Como funciona o DNS?

O processo de resolução de um nome de domínio envolve várias etapas e servidores. Veja o fluxo básico:

1. **Usuário digita** `www.exemplo.com` no navegador.
2. O sistema consulta o **cache local** (do sistema operacional ou navegador).
3. Se não houver resposta, consulta um **servidor DNS recursivo** (geralmente fornecido pelo provedor de internet ou configurado manualmente).
4. O servidor recursivo consulta:
   - **Servidor raiz**
   - **Servidor TLD** (Top-Level Domain, como `.com`, `.org`)
   - **Servidor autoritativo** (responsável pelo domínio)
5. O endereço IP correspondente é retornado ao navegador, que finalmente acessa o site.

---

## Tipos de Servidores DNS

| Tipo             | Função Principal                                                         |
| ---------------- | ------------------------------------------------------------------------ |
| **Raiz**         | Conhece os servidores responsáveis por cada TLD (como `.com`, `.net`)    |
| **TLD**          | Responsável pelos domínios de primeiro nível, como `.com`, `.edu`, `.br` |
| **Autoritativo** | Contém a informação definitiva sobre um domínio específico               |
| **Recursivo**    | Realiza consultas em nome do cliente, procurando a resposta correta      |
| **Cache**        | Armazena resultados temporariamente para agilizar consultas futuras      |

---

## Tipos de Registros DNS

| Registro  | Finalidade                                                             |
| --------- | ---------------------------------------------------------------------- |
| **A**     | Associa um nome de domínio a um endereço IPv4                          |
| **AAAA**  | Associa um nome de domínio a um endereço IPv6                          |
| **CNAME** | Define um **alias** para outro nome de domínio                         |
| **MX**    | Define os servidores responsáveis por receber e-mails do domínio       |
| **NS**    | Especifica os servidores autoritativos para o domínio                  |
| **TXT**   | Permite inserir informações arbitrárias, como verificações e políticas |
| **PTR**   | Faz a resolução reversa (IP → nome)                                    |
| **SOA**   | Contém informações administrativas do domínio                          |

---

## Exemplo de Consulta com `dig`

```bash
dig www.exemplo.com
```

Saída simplificada:

```
;; ANSWER SECTION:
www.exemplo.com.  300  IN  A  192.0.2.1
```

- `A`: tipo de registro
- `192.0.2.1`: endereço IP retornado
- `300`: tempo de vida em segundos (TTL)

---

## Resolução Reversa

A resolução reversa é o processo de obter o nome de domínio associado a um endereço IP, utilizando registros **PTR**.

```bash
dig -x 192.0.2.1
```

---

## DNS e Desempenho

- **Cache:** Evita consultas repetidas, aumentando a velocidade.
- **TTL (Time to Live):** Define por quanto tempo uma resposta pode ser armazenada em cache.
- **DNS over HTTPS (DoH) / DNS over TLS (DoT):** Protocolos que garantem privacidade ao criptografar consultas DNS.

---

## Vulnerabilidades e Segurança

- **DNS Spoofing / Cache Poisoning:** Respostas falsas são injetadas no cache, redirecionando o usuário para sites maliciosos.
- **Amplification Attacks:** O DNS pode ser usado em ataques DDoS devido à sua capacidade de gerar respostas maiores do que as requisições.

### Medidas de proteção:

- Uso de **DNSSEC** (Domain Name System Security Extensions)
- DNS criptografado (DoH, DoT)
- Caches bem configurados
- Provedores de DNS confiáveis

---

## Provedores Públicos de DNS

| Provedor        | Endereço IPv4        | Observações                        |
| --------------- | -------------------- | ---------------------------------- |
| Google DNS      | `8.8.8.8`, `8.8.4.4` | Rápido e estável                   |
| Cloudflare      | `1.1.1.1`, `1.0.0.1` | Foco em privacidade                |
| OpenDNS (Cisco) | `208.67.222.222`     | Com recursos de filtragem parental |

---

## Governança e Comercialização de Domínios

A estrutura de domínios é regulada globalmente, com várias camadas de controle e operação:

### ICANN – A Autoridade Global

A **ICANN (Internet Corporation for Assigned Names and Numbers)** é uma organização sem fins lucrativos que coordena:

- A atribuição de nomes de domínio de topo (TLDs como `.com`, `.org`, `.br`)
- O sistema global de endereços IP
- As políticas de funcionamento da Internet

### Registries – Os Operadores dos TLDs

Cada TLD tem um **registry operator**, que administra os domínios sob aquele sufixo.

| TLD    | Registry                       |
| ------ | ------------------------------ |
| `.com` | Verisign                       |
| `.org` | Public Interest Registry (PIR) |
| `.br`  | NIC.br (Brasil)                |

### Registrars – Onde você compra domínios

São empresas licenciadas pela ICANN ou pelo registry para **vender domínios ao público**:

- GoDaddy
- Namecheap
- Google Domains
- Registro.br (para `.br`)

### Revendedores

Algumas plataformas atuam como **revendedores**, oferecendo domínios através de registrars parceiros.

---

## Conclusão

O DNS é um dos pilares invisíveis da Internet moderna. Sem ele, a navegação seria limitada ao uso direto de endereços IP, tornando a experiência impraticável para os usuários. Compreender seu funcionamento, sua estrutura e governança é essencial para profissionais de redes, servidores, desenvolvimento web ou segurança da informação.

---

## Nota Final

> Este material foi produzido de forma autônoma com base em fontes abertas e confiáveis da internet, como RFCs, documentação técnica, artigos educacionais e sites institucionais.  
> Está disponível para fins educacionais e pode ser livremente compartilhado para promover o conhecimento.
