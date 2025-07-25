# Questionário – 2º Trimestre

---

### **1) Funções de agregação – CERTO ou ERRADO?**

📌 **Frase:**
“Funções de agregação operam em várias linhas e retornam 1 resultado (soma, média, contagem, etc.).”

✔ **Resposta:** CERTO
👉 Correto porque é exatamente isso que elas fazem: resumem várias linhas num só valor.

❌ **Por que não ERRADO?** Nada na frase está fora do padrão SQL.

---

### **2) INCORRETO sobre funções de agregação:**

- a) HAVING filtra depois da agregação ✅
- b) COUNT(coluna) conta até nulos ❌ (ERRADO!)
- c) ORDER BY é ascendente por padrão ✅
- d) AVG() retorna média ✅
- e) COUNT(\*) pega todas as linhas ✅

✔ **Resposta certa:** **b)**
👉 `COUNT(coluna)` NÃO conta nulos. Pra isso, usa `COUNT(*)`.

---

### **3) Relacionar funções e descrições:**

1. COUNT → B (Conta linhas)
2. MAX → E (Maior valor)
3. MIN → A (Menor valor)
4. SUM → C (Soma)
5. AVG → D (Média)

✔ **Resposta:** **c)**

---

### **4) Assertivas:**

I. Agregação pode ou não usar GROUP BY ✅
II. HAVING e WHERE são iguais ❌
III. AVG só em números ✅

✔ **Resposta:** **c) Apenas I e III corretas.**

---

### **5) Joins – alternativa correta:**

✔ **Resposta:** **a)**
👉 LEFT JOIN pega tudo da esquerda + os correspondentes da direita (ou NULL se não achar).

---

### **6) INNER JOIN traz:**

✔ **Resposta:** **e)**
👉 Só quando tiver correspondência nas duas tabelas.

---

### **7) Sobre comandos SQL:**

✔ **Resposta:** **d)**
👉 DROP TABLE apaga a tabela e tudo dentro.

---

### **8) Comando certo pra juntar Clientes e Pedidos:**

✔ **Resposta:** **d)**

```sql
SELECT Clientes.Nome, Clientes.Cidade, Pedidos.Data
FROM Pedidos
INNER JOIN Clientes ON Pedidos.IdCliente = Clientes.IdCliente;
```

---

### **9) SELECT itens com preço > 10.20**

```sql
SELECT codigo_item, nome_item, preco_item
FROM itens
WHERE preco_item > 10.20;
```

(A certa é a que mostra só os itens acima de 10.20.)

---

### **10) Biblioteca – livros disponíveis da categoria Ficção Científica**

✔ **Resposta:** **e)**

```sql
SELECT l.titulo, a.nome AS autor, c.nome AS categoria
FROM livros AS l
INNER JOIN autores AS a ON l.autor_id = a.id
INNER JOIN categorias AS c ON l.categoria_id = c.id
WHERE l.disponivel = TRUE
AND c.nome = 'Ficção Científica';
```
