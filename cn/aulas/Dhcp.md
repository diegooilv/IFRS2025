# DHCP – Dynamic Host Configuration Protocol

## 📌 O que é DHCP?

DHCP (Protocolo de Configuração Dinâmica de Hosts) é um protocolo de rede utilizado para **atribuir automaticamente endereços IP e outras configurações de rede** aos dispositivos (hosts) em uma rede.

Em vez de configurar manualmente cada dispositivo com um IP, máscara de sub-rede, gateway e DNS, o DHCP **automatiza esse processo**, facilitando a administração e reduzindo erros.

---

## ⚙️ Como funciona?

O funcionamento do DHCP ocorre em **quatro etapas principais**, conhecidas pelo acrônimo **DORA**:

| Etapa        | Descrição                                                                       |
| ------------ | ------------------------------------------------------------------------------- |
| **D**iscover | O cliente envia uma mensagem em broadcast procurando um servidor DHCP.          |
| **O**ffer    | O servidor DHCP responde oferecendo um endereço IP e outras configurações.      |
| **R**equest  | O cliente escolhe uma oferta (caso existam várias) e solicita formalmente o IP. |
| **A**ck      | O servidor confirma e finaliza a atribuição do IP com um pacote de confirmação. |

---

## 🏠 Exemplo prático

Quando você liga seu celular ou computador e se conecta ao Wi-Fi de casa:

1. O dispositivo envia um **DHCP Discover** pela rede.
2. O roteador (com servidor DHCP ativado) responde com uma **DHCP Offer**.
3. O dispositivo responde com **DHCP Request** confirmando o interesse.
4. O roteador finaliza com **DHCP Ack**, liberando o IP.

---

## 📦 O que o DHCP fornece?

Além do endereço IP, o DHCP pode entregar ao cliente:

- Máscara de sub-rede
- Gateway padrão (default gateway)
- Servidores DNS
- Tempo de concessão (lease time)
- Domínio local
- Parâmetros opcionais como servidores NTP

---

## ⏳ Lease (concessão de IP)

O IP atribuído ao host **não é permanente**. Ele vem com um **tempo de validade (lease time)**.

- Quando esse tempo expira, o IP pode ser renovado ou reatribuído.
- Isso ajuda a manter a rede organizada e evita o desperdício de endereços.

---

## 🧠 Benefícios do DHCP

- ✅ Automatiza a configuração de rede
- ✅ Reduz erros humanos
- ✅ Permite gerenciamento centralizado
- ✅ É dinâmico e adaptável a redes com muitos dispositivos

---

## ❗ E se não houver DHCP?

Caso não haja um servidor DHCP disponível e o host não tenha IP manual configurado:

- Ele poderá usar um endereço **APIPA (Automatic Private IP Addressing)**, geralmente no formato `169.254.x.x`, o que impede o acesso externo à Internet.
- Isso é útil para diagnósticos locais, mas não ideal para redes reais.

---

## 🌐 Onde o DHCP é implementado?

- Roteadores domésticos (com firmware que já inclui servidor DHCP)
- Servidores corporativos (como Windows Server, Linux ISC DHCP, etc.)
- Equipamentos de rede gerenciáveis (switches, access points)

---

## 🔐 Segurança

O DHCP **não possui autenticação nativa**, o que o torna vulnerável a:

- Ataques de spoofing (falsos servidores DHCP)
- Injeção de configurações maliciosas

➡️ Em ambientes corporativos, pode-se usar mecanismos como **DHCP snooping** e autenticação por porta (802.1X).

---

## 📚 Referências

- [RFC 2131 – DHCP Specification](https://datatracker.ietf.org/doc/html/rfc2131)
- [Cisco – DHCP Overview](https://www.cisco.com/c/en/us/tech/ios/dhcp/index.html)
- [Wikipedia – DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol)

---

> Este material foi produzido de forma autônoma com base em fontes técnicas livres e confiáveis disponíveis publicamente na internet.
