# &#x1F539; I) Selenium Teste

Realizado o teste automatizado utilizando o framework do Robot Framework com Selenium WebDriver. Fiz também com cypress. Abaixo tem os comandos para executar o teste de diferentes maneiras pelo terminal, mostrando o passo a passo que o robot irá fazer, entre outras opções pensadas e como que interpreto de realizar um determinado tipo de teste automatizado.

## Buscar pasta de testes dentro de RobotSelenium e executar o teste SL01_loginbuy.robot

    robot -d logs ./testes/SL01_loginbuy.robot

---
## 2 - Arquivo elements.robot (guardei as variáveis) arquivo ResourceWeb (guardei as keywords).

Fiz algumas adaptações para organizar melhor os arquivos e as pastas. Execução única de um arquivo de teste, mais utilizado para ir criando os steps e verificando na interface do programa sendo executada.

    robot -d logs ./testes/SL01_loginbuy.robot

Os logs de relatórios irão para o diretórios de logs. 

Executar todos os testes da pasta testes:
    
    robot -d logs ./testes

3.1 - Executar sem precisar abrir o navegador, em modo headless e executar todos testes da pasta:

    robot -d logs -v BROWSER:headlesschrome  ./testes/SL01_loginbuy.robot

    robot -d logs -v BROWSER:headlesschrome ./testes

3.2 - Executar por [Tags] os casos de testes, no caso iria marcar logo no início do arquivo o comando Tags, para testar um ou outro tipo de categorização:

    [Tags]      Incompleto

    robot -d logs --include Incompleto ./testes

4 - Criar o teste em si até finalizar a compra, utilizando pageobjects para encapsulamento de variáveis.

:white_check_mark: Finalidade desse tipo de implementação de Padrão Page Object, para mais escalabilidade, mais fácil manutenção.

:white_check_mark: Padrão de encapsulamento, agrupamento de keywords. (Criar um step de funcionalidade com vários argumentos com conceitos de programação)

## :white_check_mark: 5 - Fiz algumas keywords extras (máximo de evidências), para forçar errors no teste ou na aplicação web, cobrir ao máximos com os elementos disponíveis. 

    
## Observações :
- No Cypress, só executando o que foi pedido no Desafio, tempo de execução 08.59 a 9.50 depende da conexão , é possível diminuir para 03.40 sem causar erro tirar os wait, coloquei só para demonstrar o teste rodando, ver os campos sendo preenchidos e avançando.
    
- O Robot Framework com Selenium, acredito chegar em um tempo próximo de 15segundos o teste automatizado, pois algumas vezes ele se perde ou quebra se for muito rápido ,a se analisar.

- Fiz mais detalhado no Selenium utilizando técnicas de encapsulamentos, de page objects e outras boas práticas. Assim como no cypress.

- O fluxo do teste no Robot Selenium , cobri mais o teste realizado em 24 segundos o fluxo por completo.Quis forçar as possibilidades que o usuário poderia fazer na aplicação, desde preenchimentos incorretos, remover item que colocou sem querer, e utilizar a maior parte dos botões apresentadas na interface.

---

# &#x1F539; I) Cypress Teste

## Executar teste no Cypress, estando com o terminal localizado na pasta integration: 
Cypress/cypress/integration/SL_login&buy.js

Executar com uma das seguintes opções:

    npx cypress run 
    npx cypress open

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

# &#x1F539; Observações :

Tempo de execução 08.55 , daria para diminuir para 03.40 sem causar erro tirar os wait, coloquei só para demonstrar o teste rodando para algum usuário. 

Comparado com o Robot Framework com Selenium, costuma não acompanhar o tempo de execução do teste e se perde algumas vezes, o Cypress achei com essa performance melhor. Vantagens e desvantagens em cada ferramenta.


--- 
# III) Outros conhecimentos teóricos de Selenium e Testes automatizados, anotações Cadu Mega.
## Dicas ao criar e rever os scripts de Testes Automatizados / Conhecimentos mais teóricos

Estilo keyword-driven, como explicar o script em partes da lógica de programação.
Subdividir em blocos de script conforme a tela que esta ou os comportamentos analisados(verificar,preencher,...).

O Robot pode ser mais rápido que as requisições do script ou mais lento e se perder para achar o elemento html da página.

Verificar caracteres, sintaxe ou seu locator estao apontando corretamente.
Checkpoints são as validações, as confirmações em uma página da web em que o teste irá percorrer/checar.

Seja breve e claro, não use termos técnicos. Mas o principal é apresentar uma solução.

Colocar-se no lugar do usuário para detectar dificuldades durante o uso.

Se perguntar:

O que o usuário faria agora? Como o usuário se sentiria diante desse fluxo? Se sentiria confuso? Conseguiria concluir uma ação com facilidade?

Avaliar a capacidade do software de se adaptar aos diferentes tipos de usuários.

ex: Usuários avançados, usuários que usam tecnologia há pouco tempo ou com pouca frequencia, deficientes visuais, daltônicos.

---

-Fazer de maneira estrutural os testes.

-Conhecer o que vou encontrar, precisar, como vou monitorar minhas ações e como lidar com possíveis problemas.

-O que fazer nos testes e o que não fazer, cuidado com questões de segurança da informação.

-Padrões de projeto podem ser vistos como uma solução que já foi testada para um problema. Desta forma , um padrão de projeto geralmente descreve uma solução ou uma instância da solução que foi utilizada para resolver um problema específico. Padrões de projetos são soluções para problemas que alguém um dia teve e resolveu aplicando um modelo que foi documentado e que você pode adaptar integralmente ou de acordo com necessidade de sua solução.

---

## Boas práticas e heurísticas (PESQUISA)

- Um teste de aceitação, teste de unidade não é bom depender de outro teste para executar corretamente.

- Simplificar passos de forma contextualizada.

- Colocar o máximo possível de evidências. Gravar a tela com o fluxo.

- Testes exploratórios para identificar se está funcionando corretamente os componentes da tela, das aplicações.

- Heurística ALTERFACE:
Princípio Activation - Princípio Layers (camadas) - Princípio Timing
Princípio Exclusão - Princípio Removable - Princípio Float
Princípio Achievable - Princípio Collision - Princípio Expansion

• Princípio de Activation
Testes exploratórios buscando inconsistências com base no princípio da ativação, explorando a aplicação web.
Olhando o elemento e identificar o que deveria fazer. Anotar qualquer tipo de inconsistência.
Botões que interagem e fazem o que deveriam fazer, comportamento esperado?
Clica no botão abre submenus, clica no botão novamente recolhe. (clicar em um submenu, e o outro ocultar q estava aberto)
Componentes que habilitam ou desabilitam algo.
Mudança de estado ao passar o mouse como o hover.
Menus que trocam a ação selecionada, com o mesmo comportamento.
Botões dão algum tipo de ação, passar o mouse aparece tool tip.

Ao clicar mostrar algumas opções, só que o menu flutuante sumiu, inconsistência encontrada.
Menu flutuante não conseguiu lidar com o clique.

• Princípio das Layers (camadas)
Precisam estar na camada correta.
Ocupar a camada que foi estabelecida. A tooltip ficou atrás da opção 1.
Tooltips a frente de tudo, a frente das camadas e não no intermédio entre elas.
Algum tipo de elemento que sobrescreve outro.
Verificar elementos flutuantes, em quanto desço a página, o menu flutua, menu superior a frente de tudo.

• Princípio de Timing
Tempo específico para aparecer e desaparecer os elementos, é o tempo apropriado?
Tempo da transição esta apropriado?
Aplicado muito em mensagens, tooltips.

• Princípio de exclusão
2 elementos ao mesmo tempo no mesmo lugar, você não consegue ler ou interagir adequadamente.
Uma janela se movimentar, para não ficar uma em cima da outra.
Preserva o tooltip, 2 elementos abertos e não consigo entender ou interagir com o de trás.
Alinhar para conseguir ver os 2.

Ao mover o mouse permite enxergar o elemento de trás?

• Princípio do Removable
Alguns elementos surgem na tela, quando executa um tipo de ação/disparar uma ação, o elemento precisa sumir da tela e não continuar.
Abrir o Menu ao passar o mouse
Mudar a cor do botão ao passar o mouse.
Clicar no botão e depois retornar o botão ao estágio inicial.

Não volta ao estágio inicial, só clicando fora.

• Princípio Float
Objetos flutuantes, menu superior, menu lateral, precisam continuar flutuando ao mover a barra de rolagem.
Surgir algum objeto, passa a ser um objeto flutuante também para acompanhar o arrastar da página.
Tela modal, é uma tela de foco que precisa preencher ou tomar ação de algo como principal.
Modais não permitem scroll, as demais permitem.

• Princípio Achievable

Não consegue atingir o objeto, pois só fica visível um limite de elementos da página, a barra de rolagem não deixa verificar mais. Conseguir acessar todos os elementos.
Conseguir ver até o último elemento.

• Princípio Collision
Acessa os elementos da página, interage com eles, só que colidem com outros objetos, fazendo com que outros elementos saiam do lugar.
Empurrar sem quebrar os elementos, sem impacta-los.

• Princípio Expansion
Componentes que foram desenhados para estarem juntos com outros elementos. Aplicação quebra ao passar o mouse, ou abrir em alguma ação. Quebrando a ação.
Nada que eu altere na tela, quebra os elementos ao redor.

___
