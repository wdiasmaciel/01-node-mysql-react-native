# Banco de Dados: Node + MySQL + React Native

Nós vamos utilizar o **GitHub Codespaces** para realizar as nossas práticas. Isso significa que você não precisa instalar programas no seu computador pessoal. Tudo vai rodar diretamente no seu navegador.

---

## Abrindo o Ambiente (Codespaces)

1. No topo desta página do repositório no GitHub, clique no botão verde **`< > Code`**.
2. Clique na aba **Codespaces**.
3. Clique no botão verde **Create codespace on main**.
4. Aguarde alguns instantes até que o VS Code abra no seu navegador.

---

## Configurar o Ambiente: instalar o Node, o MySQL e o React Native

No Codespaces, adicione o `Node.js`, o `MySQL` e a extensão `Database Client` do `VS Code` diretamente no container do `Codespace`, usando um arquivo de configuração `devcontainer.json`. 

Além disso, inicie o serviço do `MySQL` de forma automática assim que o `Codespaces` abrir.

Crie uma pasta chamada `.devcontainer` na raiz do seu repositório do GitHub. Dentro dela, crie um arquivo chamado `devcontainer.json` com o código abaixo:

```json
{
  "name": "Aulas de Node.js, Banco de Dados (MySQL) e React Native",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "customizations": {
    "vscode": {
      "extensions": [
        "cweijan.vscode-mysql-client2"
      ]
    }
  },
  "onCreateCommand": "sudo apt update && sudo apt install -y nodejs npm && sudo apt-get install -y mysql-server git-lfs && git lfs install",
  "postStartCommand": "sudo mkdir -p /var/run/mysqld && sudo chown mysql:mysql /var/run/mysqld && sudo /usr/sbin/mysqld --user=mysql &"
}
```

---

## Rebuild

No `VS Code` do `Codespaces`, digite `CTRL + SHIFT + P`. Na barra de pesquisa digite `rebuild`. Selecione a opção `Codespaces: Rebuild Container`. Clique no botão `Rebuild`. Aguarde o término do processamento.

## Versão

No terminal, execute os comandos abaixo, para visualizar a versão instalada do `Node.js`, do `Node Package Manager (NPM)` e do `MySQL`:  :

```bash
node -v 
```

```bash
npm -v
```

```bash
mysql --version
```

**OBS**: no caso do `MySQL`, pode ser que seja necessário executar `mysql -V` ou executar o comando `SELECT VERSION()`; após acessar o prompt do banco de dados.