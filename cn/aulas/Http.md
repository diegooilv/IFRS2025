# Protocolo HTTP

## Introdução

O **HTTP (Hypertext Transfer Protocol)** é o protocolo padrão da Web, utilizado para a comunicação entre **clientes** (como navegadores) e **servidores web**. Ele permite a troca de recursos como páginas HTML, imagens, vídeos, arquivos e dados em geral.

HTTP opera na **camada de aplicação** do modelo TCP/IP e usa o **protocolo TCP** como transporte. É um protocolo **sem estado**, baseado no modelo **cliente-servidor**, e geralmente utiliza a **porta 80**.

---

## Características do HTTP

- **Texto puro (legível):** As mensagens HTTP são baseadas em texto, facilitando a leitura e o uso por desenvolvedores.
- **Sem estado (stateless):** O protocolo não mantém informações entre requisições. Cada requisição é independente.
- **Cliente-servidor:** O cliente faz a requisição; o servidor processa e responde.
- **Flexível:** Suporta diferentes métodos, formatos de dados e extensões como cookies e cache.

---

## Estrutura da Comunicação

### Requisição HTTP (cliente → servidor)

Uma requisição típica contém:

```
[Método] [Recurso/URI] [Versão do HTTP]
Cabeçalhos
[Corpo - opcional]
```

**Exemplo:**

```
GET /index.html HTTP/1.1
Host: www.exemplo.com
User-Agent: Mozilla/5.0
```

---

### Resposta HTTP (servidor → cliente)

```
[Versão do HTTP] [Código de Status] [Mensagem]
Cabeçalhos
[Corpo - opcional]
```

**Exemplo:**

```
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 512

<html>...</html>
```

---

## Métodos HTTP

| Método      | Uso Principal                                                             |
| ----------- | ------------------------------------------------------------------------- |
| **GET**     | Solicita dados do servidor. Usado para recuperar recursos.                |
| **POST**    | Envia dados ao servidor, geralmente para criação ou envio de formulários. |
| **PUT**     | Atualiza completamente um recurso.                                        |
| **PATCH**   | Atualiza parcialmente um recurso.                                         |
| **DELETE**  | Remove um recurso.                                                        |
| **HEAD**    | Igual ao GET, mas retorna apenas os cabeçalhos.                           |
| **OPTIONS** | Descobre os métodos suportados para um recurso.                           |

---

## Códigos de Status HTTP

| Código | Categoria        | Significado Básico                      |
| ------ | ---------------- | --------------------------------------- |
| 1xx    | Informativo      | Processamento iniciado                  |
| 2xx    | Sucesso          | A requisição foi bem-sucedida           |
| 3xx    | Redirecionamento | Recurso movido ou redirecionado         |
| 4xx    | Erro do Cliente  | Requisição mal formulada ou inválida    |
| 5xx    | Erro do Servidor | Falha interna ao processar a requisição |

**Exemplos comuns:**

- **200 OK**: Requisição bem-sucedida.
- **301 Moved Permanently**: Redirecionamento permanente.
- **404 Not Found**: Recurso não encontrado.
- **500 Internal Server Error**: Erro interno no servidor.

---

## Versões do HTTP

| Versão       | Principais Características                                                 |
| ------------ | -------------------------------------------------------------------------- |
| **HTTP/1.0** | Conexões encerradas a cada requisição.                                     |
| **HTTP/1.1** | Suporte a conexões persistentes (`keep-alive`), cache, headers otimizados. |
| **HTTP/2**   | Multiplexação de requisições, compressão de cabeçalhos, binário.           |
| **HTTP/3**   | Utiliza o protocolo **QUIC** ao invés de TCP para reduzir latência.        |

---

## Ferramentas para Trabalhar com HTTP

- **curl** – Faz requisições HTTP via terminal:
  ```bash
  curl -v http://www.exemplo.com
  ```
- **Inspecionar Elemento no Navegador** – Aba "Network" mostra todas as requisições HTTP.
- **Postman** – Interface gráfica para testar APIs.

---

## Conclusão

O protocolo HTTP é a base da comunicação na Web. Apesar de ser simples, ele é extremamente poderoso, permitindo uma ampla gama de aplicações, desde páginas estáticas até APIs REST complexas. O conhecimento detalhado de como HTTP funciona é fundamental para qualquer desenvolvedor, administrador de redes ou profissional da área de tecnologia.

---

## Nota Final

> Este material foi produzido de forma autônoma com base em conhecimentos amplamente disponíveis na literatura técnica e em fontes públicas da internet, como RFCs (Request for Comments), documentação oficial, artigos educativos e materiais didáticos de livre acesso.  
Seu uso é livre para fins de estudo e disseminação do conhecimento.
