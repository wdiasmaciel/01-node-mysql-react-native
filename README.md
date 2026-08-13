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

---

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

---

## Crie um Novo Projeto do Node.js

No terminal, execute o comando abaixo:

```bash
npm init
```

Informe o nome do projeto (package name), ou apenas pressionar a tecla `<ENTER>`: `meu-app`

Informe a versão, ou apenas pressionar a tecla `<ENTER>`: `<ENTER>`

Informe uma descrição para o projeto:  `meu aplicativo`

Informe o arquivo principal (inicial) da aplicação (entry point), ou apenas pressionar a tecla `<ENTER>`: `server.js`

Informe um comando de teste, ou apenas pressionar a tecla `<ENTER>`: `<ENTER>`

Informe o repositório do projeto no `GitHub`, ou apenas pressionar a tecla `<ENTER>`: `<ENTER>`

Informe as palavras-chave do projeto, ou apenas pressionar a tecla `<ENTER>`: `Node.js MySQL React-Native`

Informe o nome do autor do projeto, ou apenas pressionar a tecla `<ENTER>`: `<informe seu nome>`

Informe a licença do projeto, ou apenas pressionar a tecla `<ENTER>`: `<ENTER>`

Informe o tipo do projeto: `module`


**OBS**: caso não seja requisitado o tipo do projeto, você terá que informar `"type": "module",`no arquivo `package.json` gerado:

```json
{
  "name": "meu-app",
  "version": "1.0.0",
  "description": "meu aplicativo",
  "main": "server.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/wdiasmaciel/01-node-mysql-react-native-bd.git"
  },
  "keywords": [
    "Node.js",
    "MySQL",
    "React-Native"
  ],
  "author": "Wesley",
  "license": "ISC",
  "type": "module",
  "bugs": {
    "url": "https://github.com/wdiasmaciel/01-node-mysql-react-native-bd/issues"
  },
  "homepage": "https://github.com/wdiasmaciel/01-node-mysql-react-native-bd#readme"
}
```

---

## Pacotes: express, mysql2 e cors

No terminal, instale os pacotes abaixo:

```bash
npm install express mysql2 cors
```

**OBS**: verifique a inclusão dessas dependências no arquivo `package.json`:

```
{
  "name": "meu-app",
  "version": "1.0.0",
  "description": "meu aplicativo",
  "main": "server.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/wdiasmaciel/01-node-mysql-react-native-bd.git"
  },
  "keywords": [
    "Node.js",
    "MySQL",
    "React-Native"
  ],
  "author": "Wesley",
  "license": "ISC",
  "type": "module",
  "bugs": {
    "url": "https://github.com/wdiasmaciel/01-node-mysql-react-native-bd/issues"
  },
  "homepage": "https://github.com/wdiasmaciel/01-node-mysql-react-native-bd#readme",
  "dependencies": {
    "cors": "^2.8.6",
    "express": "^5.2.1",
    "mysql2": "^3.23.3"
  }
}
```

---

