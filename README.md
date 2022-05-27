# senseDataTeste

1 - Criação de repositórios
2 - Criação das pastas
  2.1 - Configurações e instalações de dependências no Cypress
    2.2 - Irei instalar o cypress localmente na pasta do projeto, executar terminal dentro da pasta.

    npm init -y.         //  (Irá criar uma file package.json para configs)
    npm install cypress  //  (Irá instalar o cypress no projeto, alguns arqs de configs no node_modules)
    npx cypress open    (irá carregar para abrir e irá criar a pasta do projeto)

3 - Dentre as pastas criadas que são 4, iremos apagar as subpastas de exemplos getting-started e advanced-examples.

4 - Irei criar uma pasta page_objects, afim de facilitar a criação de objetos com métodos que irei repetir nos testes.
   
   4.1 - Vou aproveitar para criar um método que irá ter a função de logar o username e password. Crio o arquivo object.js
   
   4.2 - Na pasta integration que crio o meu primeiro teste SL1_Login.js, importei o arquivo object.js para realizar a chamada corretamente nessa pasta, onde posso colocar variáveis ou outras funções para simplificar o teste.
   
   4.3 - Como tem os atributos únicos de id , foi mais fácil de realizar essa seleção de elementos.
   
   4.4 - Quero ver se esta executando tudo certo na ferramenta. Para rodar os testes executo no terminal npx cypress run.

5- Obtive uns bugs ao abrir a interface do Cypress, que precisava executar os seguintes comandos:

    npm i -D cy-verify-downloads    
    npm install cypress-downloadfile

6- Executo novamente npx cypress run

7 - Deu um erro de segurança do navegador no qual tive que colocar algumas configurações no json. "chromeWebSecurity": false

8 - Primeiro teste de LOGIN OK!

9 - Para agilizar o processo irei utilizar uma ferramenta de target(Open Select Playground) de elemento da própria ferramenta, para identificar sem precisar inspecionar o elemento a todo momento, basta eu clicar nela e apontar o elemento que quero, retorando para mim o atributo do elemento.

    // 9.1 - verificar teste SL1_Login.js e page_objects login_page.js

10 - Parei a execução no terminal (ctrl c) se quiser executar novamente só digitar 

    npx cypress run 

e irá executar pelo terminal aparecendo se passou ou não. Caso execute querendo abrir a interface do programa ,digite 

    npx cypress open.

