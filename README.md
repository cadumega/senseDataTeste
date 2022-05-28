# senseDataTeste
I) Cypress Teste
obs: executar npx cypress run ou npx cypress open em:
    
Cypress/cypress/integration/SL1_Login.js

---
1 - Criação de repositórios

2 - Criação das pastas

2.1 - Configurações e instalações de dependências no Cypress

2.2 - Irei instalar o cypress localmente na pasta do projeto, executar terminal dentro da pasta.

    npm init -y         //  (Irá criar uma file package.json para configs)
    npm install cypress  //  (Irá instalar o cypress no projeto, alguns arqs de configs no node_modules)
    npx cypress open    (irá carregar para abrir e irá criar a pasta do projeto)

3 - Dentre as pastas criadas que são 4, iremos apagar as subpastas de exemplos getting-started e advanced-examples.

4 - Irei criar uma pasta page_objects, afim de facilitar a criação de objetos com métodos que irei repetir nos testes.
   
   4.1 - Vou aproveitar para criar um método que irá ter a função de logar o username e password. Crio o arquivo object.js
   
   4.2 - Na pasta integration que crio o meu primeiro teste SL_login&buy.js, importei o arquivo object.js para realizar a chamada corretamente nessa pasta, onde posso colocar variáveis ou outras funções para simplificar o teste.
   
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


---

Observações :

Tempo de execução 08.55 , daria para diminuir para 03.40 sem causar erro tirar os wait, coloquei só para demonstrar o teste rodando para algum usuário. 

Comparado com o Robot Framework com Selenium, costuma não acompanhar o tempo de execução do teste e se perde algumas vezes, o Cypress achei com essa performance melhor. Vantagens e desvantagens em cada ferramenta.


---

II) Selenium Teste

1 - Implementação de Padrão Page Object para mais escalabilidade, mais fácil manutenção.
# Padrão de encapsulamento, agrupamento de keywords. (Criar um step de funcionalidade com vários argumentos com conceitos de programação)


 
    // Observações :
    // Back to home esta retornando a tela de produtos.
    // Tempo de execução 08.59 a 9.50 depende da conexão , é possível diminuir para 03.40 sem causar erro tirar os wait, coloquei só para demonstrar o teste rodando, ver os campos sendo preenchidos e avançando.
    // O Robot Framework com Selenium, costuma não acompanhar o tempo de execução do teste e se perde algumas vezes, o Cypress achei com essa performance melhor. Vantagens e desvantagens em cada ferramenta.