# 📚 Aulas – 13/06 a 04/07

Aulas voltadas pra realização de atividades e trabalhos, com ou sem ajuda direta do professor. Também rolou implementação de novos componentes no GUI usando o Apache NetBeans.

🔗 [Swing – Documentação oficial](https://docs.oracle.com/javase/8/docs/api/javax/swing/package-summary.html)

> Durante essas aulas, não anotei tudo passo a passo porque não teve muita novidade. Foi mais aplicação prática do que já sabíamos, com alguns ajustes e adições. Então, juntei tudo aqui de forma resumida.

---

## 🔑 ID Automático

Pra gerar ID automático no campo do `JTextField`, o controle é feito no próprio controlador:

```java
private int gerarId() {
    return listHerois.isEmpty() ? 0 : listHerois.getLast().getId() + 1;
}

private void limpar() {
    jTextFieldId.setText(String.valueOf(gerarId()));
    jTextFieldCargo.setText("");
    jTextFieldCidade.setText("");
    jTextFieldIdade.setText("");
    jTextFieldNome.setText("");
}
```

> ⚠️ **Dica:** travar edição do campo de ID é sempre bom:
> `jTextFieldId.setEditable(false);`

---

## 🛠️ Edição de Itens no JList

A ideia é simples: pega o item selecionado, guarda em um objeto temporário e altera os dados com os `set`.

```java
private void alterar() {
    for (Pessoa po : arrayListPessoa) {
        String msg = "Nome: " + jTextFieldNome.getText() + " Numero: " + jTextFieldNumero.getText();
        String msg2 = "Nome: " + po.getNome() + " Numero: " + po.getNumero();
        if (msg.equals(msg2)) {
            limpar();
            jButton.setText("Criar");
            return;
        }
    }

    pessoaEditar.setNome(jTextFieldNome.getText());
    pessoaEditar.setNumero(jTextFieldNumero.getText());
    carregar();
    jButton.setText("Criar");
    limpar();
}

public void editar() {
    String msg = jList.getSelectedValue();
    if (msg == null || msg.isEmpty()) {
        jLabel.setText("Selecione algo na Lista!");
        return;
    }

    for (Pessoa p : arrayListPessoa) {
        String msg2 = "Nome: " + p.getNome() + " Numero: " + p.getNumero();
        if (msg.equals(msg2)) {
            pessoaEditar = p;
            jTextFieldId.setText(String.valueOf(p.getId()));
            jTextFieldNome.setText(p.getNome());
            jTextFieldNumero.setText(p.getNumero());
            jButton.setText("Editar");
            break;
        }
    }
}
```

---

## 🧍 Criar Novo Usuário

Cria uma nova `Pessoa` e verifica se já existe pra não duplicar:

```java
private void criar() {
    Pessoa p = new Pessoa(
        Integer.parseInt(jTextFieldId.getText()),
        jTextFieldNome.getText(),
        jTextFieldNumero.getText()
    );

    String msg = "Nome: " + p.getNome() + " Numero: " + p.getNumero();
    for (Pessoa po : arrayListPessoa) {
        String msg2 = "Nome: " + po.getNome() + " Numero: " + po.getNumero();
        if (msg.equals(msg2)) {
            jLabel.setText("Essa Pessoa Já Existe!");
            return;
        }
    }

    arrayListPessoa.add(p);
    carregar();
}

private void carregar() {
    defaultListModel.clear();
    arrayListString.clear();

    for (Pessoa p : arrayListPessoa) {
        arrayListString.add("Nome: " + p.getNome() + " Numero: " + p.getNumero());
    }

    defaultListModel.addAll(arrayListString);
    jList.setModel(defaultListModel);
}
```

---

## 🔘 Botão "2 em 1" (Criar / Editar)

Um mesmo botão serve pra criar ou editar, dependendo do texto dele.

```java
public void botao() {
    String nome = jButton.getText();
    if (nome.equals("Criar")) {
        novoUsuario();
    } else if (nome.equals("Editar")) {
        alterar();
    }
}

// Esse método é chamado na ação do botão
private void novoUsuario() {
    criar();
    carregar();
    limpar();
}
```

---

## 📁 Trabalhos Realizados

| Exercício | Descrição                                    | Link                                                                                                 |
| --------- | -------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| **2.3**   | Criação de lista com `ArrayList`             | [ArrayList.zip](../exercicios/Segundo%20Trimestre/2.3/ArrayList.zip)                                 |
| **2.4**   | Alteração + comentários no código            | [AlterarArrayListComentado.zip](../exercicios/Segundo%20Trimestre/2.4/AlterarArrayListComentado.zip) |
| **2.5**   | (Não relacionado à disciplina)               | —                                                                                                    |
| **2.6**   | Versão intermediária (foi atualizada na 2.7) | —                                                                                                    |
| **2.7**   | Versão final com tudo pronto                 | [Trabalho 2.7.zip](../exercicios/Segundo%20Trimestre/2.7/Trabalho%202.7.zip)                         |
