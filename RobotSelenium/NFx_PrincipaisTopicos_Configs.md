**Resumo dos arquivos NF\_**

Testes são compostos de pré condições + ações + resultados esperados e as vezes pós condições (como fechar o navegador, voltar pra página home, apagar registro no banco de dados, etc), isso também deve ocorrer na automação de testes. Toda essa gama de comportamentos possíveis que serão realizados na aplicação, irão precisar estar cobertos, reque um conhecimento amplo em outras áreas de tecnologia, heurísticas, boas práticas.

---

## Atualização Robot e comandos

pip install --upgrade robotframework

pip install --upgrade pip

pip install -U robotframework-pabot

pip list

c:\users\user\appdata\local\programs\python\python39\python.exe

---

robotmetrics

---

## Extensões úteis:

Robot Framework Formatter
Robot Framework Helper
Robot Framework Intellisense
Robot Framework Fork
Robot Framework Language

---

### Libraries

https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
http://robotframework.org/robotframework/latest/libraries/BuiltIn.html
http://robotframework.org/robotframework/latest/libraries/DateTime.html
http://robotframework.org/robotframework/latest/libraries/String.html
https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html#library-documentation-top
http://robotframework.org/robotframework/latest/libraries/Collections.html

https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html#Normalize%20Path
https://robotframework.org/robotframework/2.1.2/libraries/OperatingSystem.html

https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html

---

## Códigos de status de respostas - indicam o retorno da requisição

https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status

Respostas de informação (100-199),
Respostas de sucesso (200-299),
Redirecionamentos (300-399)
Erros do cliente (400-499)
Erros do servidor (500-599).

---

## Dicas ao criar e rever os scripts de Testes Automatizados da NFeMail:

Estilo keyword-driven, como explicar o script em partes da lógica de programação.
Subdividir em blocos de script conforme a tela que esta ou os comportamentos analisados(verificar,preencher,...).
O Robot pode ser mais rápido que as requisições do script ou mais lento e se perder para achar o elemento html da página.
Verificar caracteres, sintaxe ou seu locator estao apontando corretamente.
Checkpoints são as validações, as confirmações em uma página da web em que o teste irá percorrer/checar.

Seja breve e claro, não use termos técnicos. Mas o principal é apresentar uma solução.

ex: Problema ao se conectar! Concecte-se à internet e tente novamente (botao - Abrir opções de Wifi)

Colocar-se no lugar do usuário para detectar dificuldades durante o uso.

Se perguntar:
O que o usuário faria agora? Como o usuário se sentiria diante desse fluxo? Se sentiria confuso? Conseguiria concluir uma ação com facilidade?

Testar em diferentes dispositios e/ou configurações de hardware para perceber se dificuldades de uso surgem/são acentuadas.

Avaliar a capacidade do software de se adaptar aos diferentes tipos de usuários.

ex: Usuários avançados, usuários que usam tecnologia há pouco tempo ou com pouca frequencia, deficientes visuais, daltônicos.

---

-Fazer de maneira estrutural os testes.

-Conhecer o que vou encontrar, precisar, como vou monitorar minhas ações e como lidar com possíveis problemas.

-O que fazer nos testes e o que não fazer, cuidado com questões de segurança da informação.

-Padrões de projeto podem ser vistos como uma solução que já foi testada para um problema. Desta forma , um padrão de projeto geralmente descreve uma solução ou uma instância da solução que foi utilizada para resolver um problema específico. Padrões de projetos são soluções para problemas que alguém um dia teve e resolveu aplicando um modelo que foi documentado e que você pode adaptar integralmente ou de acordo com necessidade de sua solução.

---

Click para acesso de login em uma página,mas não existe atributo "name" e "id".
ex:
xpath://button[contains(@class, "signin")]

---

## Boas práticas e heurísticas (PESQUISA3)

Um teste de aceitação, teste de unidade não é bom depender de outro teste para executar corretamente.

Simplificar passos de forma contextualizada.

Colocar o máximo possível de evidências. Gravar a tela com o fluxo.

Testes exploratórios para identificar se está funcionando corretamente os componentes da tela, das aplicações.

Heurística ALTERFACE:
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

### Roboweek QA Ninja
Dado que
Quando eu/preencho/acesso
Mas 
entao vejo/a/abro/esta/o status /devo
e vejo/clico/deve


Suite Setup Inica sessão antes de tudo
Suite Teardown Encerra sessao depois de tudo
Teste Teardown Depois do teste

Historias/Cenarios smart o Dado esta com varios steps, encapsulado. Cenários mais objetivos e fácil de lembrar_senha

Keyword:
Capture Page Screenshot

[tags] bugs
-d ./log -i bug tests\cadastro.robot

Ter rastreabilidade com TS001

Set Windows Size  1280    800

##Helpers Processos de desenvolvimento para escalabilidade
Cenários interdependentes

Dynamic steps conceito do cucumber para Robot

Fluxo sendo o mesmo faça o encapsulamento.
Redução de especificação , cenário outliner do cucumber , teste template Robot
[Template] que apresenta o mesmo comportamento.
[Template]

---

## Tópicos Importantes, Backlog de estudos:

Locators in webpage

Set Selenium Speed & Sleep
Set & Get Selenium Timeout
Implicitly Wait

Define and Display Variables

Work on TextBox
Work on Radio Button | Checkbox | Link | Button
Work on List or Dropdown
Write Keywords in Test Case - With Argument | Without Argument

Running a For Loop
Conditionally RunKeyword

Goto | Go Back | Get Location

Apply Validations:
Page Contains & Page should not contains
Page should contains element
Validate Checkbox
Validate Text on Element
Validate Title / Element Enable / Visible

Create Resource Files:
User defined Keyword without Argument

Add Documentations
Add Timeout

API rest

---

## Alterações no layout do Visual Studio - Fontes e Cores

texto sem formatação
numero da linha
nome de atributo html
nome de elemento html
valor atributo html
valor do modelo do cliente HTML
marca de controle antes de salvar
marca de controle depois de salvar

painel gerenciador de soluções (vertical)
painel de pesquisa (vertical)

Atalhos similares ao do vscode, precisa alterar o padrão em configurações
ctrl+k+d ,mover bloco com espaçamento <

---

## Executar por tags os testes.

Especificar em Test Case a tag em si: ##[tags] smoketest

No terminal:
robot -d ./results --include smoketest SALVA_NOTA\testsWeb\

p/ headless nesse modo, teria que colocar nas options browse:
robot -d ./results -v BROWSER:headlesschrome --include smoketest SALVA_NOTA\testsWeb\

## Executar todos os testes do Salva Nota, abrindo o navegador

robot --test _SVN_ .

## Executar todos os testes do Salva Nota, modo (HEADLESS) roda em segundo plano o teste no terminal.

robot -d ./results -v BROWSER:headlesschrome --test _SVN_ .

## Executar um teste específico sem abrir navegador, modo (HEADLESS) roda em segundo plano o teste no terminal.

robot -d ./results -v BROWSER:headlesschrome SALVA_NOTA\testsWeb\SVN_1_Login_Logout.robot

## Paralelismo para executar os testes, todos ao mesmo tempo, não executou totalmente 100% correto como as outras formas (headless ou padrão).

pabot --testlevelsplit [path to tests]
Pesquisando...
Though you should know that this will not magically make your tests thread-safe. In other words Pabot can only help you with the execution part, but your test cases will need to be designed with parallelization in mind. For example, test cases that make changes to a database or edit a global file may not be parallelization-friendly and will need to be redesigned with parallelization in mind.

First install pabot:

pip3 install -U robotframework-pabot
Then you can run rest under case directory in parallel as simple as:

pabot --testlevelsplit case

pabot -v BROWSER:headlesschrome --test _SVT_ .  
pabot -d ./results -v BROWSER:headlesschrome --test _SVT_ .  
pabot -d ./results --processes 3 -v BROWSER:headlesschrome --test _SVT_ .  
pabot --processes 3 -v BROWSER:headlesschrome --test _SVT_ .

---

https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-4.0.rst

---

## Basic IF syntax

The new native IF syntax starts with IF (case-sensitive) and ends with END (case-sensitive). The IF marker requires exactly one value that is the condition to evaluate. Keywords to execute if the condition is true are on their own rows between the IF and END markers. Indenting keywords in the IF block is highly recommended but not mandatory.

In the following example keywords Some keyword and Another keyword are executed if ${rc} is greater than zero:

**_ Test Cases _**
Example
IF ${rc} > 0
Some keyword
Another keyword
END

or

Example
IF $rc > 0
Some keyword
ELSE
Another keyword
END

---

## For loop enhancements

The for loop syntax has got several enhancements:

The most noticeable change is that loops nowadays end with an explicit END marker on its own row and keywords inside the loop do not need to be escaped with a backslash. (#3009)
Another visible change is that the for loop marker used to be :FOR (case-insensitive) when nowadays just FOR (case-sensitive) is enough. (#2990)
Also the for loop separators IN, IN RANGE, IN ENUMERATE and IN ZIP were changed to be both case- and space-sensitive. (#2991)
As a result of these changes, for loops can now be written like this:

FOR ${animal} IN cat dog cow
Keyword ${animal}
Another keyword
END

---

## How do I use Click Element function with robot framework when the element does not have id or name?

If you want to click the first instance of locator, then you can use as below:

Click Element ${Locator}[1]

You could also use xpath as locator, which would look like this for selecting the first element with the given id:

Click Element | //\*[@id='elementId'][0]

I recommend to be a bit more flexible. The good approach if you find the balance between define flexible and unique. Otherwise the smallest site change will breake your test.
Following example should match on the previous example:

Match on any link that contain LOGIN text

Click Element //a[contains(text(),'LOGIN')]
Match on any element that contain LOGIN text

Click Element //\*[contains(text(),'LOGIN')]
Match on any element where the class attribute equal with "transparentBtn loginLink ng-scope"

Click Element //a[@class="transparentBtn loginLink ng-scope"]
You can check multiple attributes at the same time

Click Element //a[@class='transparentBtn loginLink ng-scope' and @ng-click='commonService.gigyaRaasLogin()']
You can use contains() to check if string part of the class attribute

Click Element //a[contains(@class,'loginLink')]

---

## Select option robotframework - radio button

The XPath used to locate the correct radio button then looks like this: //input[@type='radio' and @name='group_name' and (@value='value' or @id='value')]

Examples:

Select Radio Button size XL # Matches HTML like <input type="radio" name="size" value="XL">XL</input>

Select Radio Button size sizeXL # Matches HTML like <input type="radio" name="size" value="XL" id="sizeXL">XL</input>

Select From List By Index name:Trail.NationalParkId 1

---

## ATALHOS VS CODE (no editor):

Cntrl / add Coment
Alt seta Up Down Move linha para cima ou baixo
Alt Click left Add Select Cursor
Alt E cursor end of line
Alt Q cursor begin of line
Alt 1,2,3 alternar abas
Alt F1 e F2 run code e clear output
Alt L O abre no chrome o LiveServer em tempo real
Shift Home/End Select text in line all for right or left
Cntrl Shift K Remove Line
Shift . + seta Up Down copia uma linha para baixo
Cntrl B abre aba lateral arqs..
Cntrl F2 trocar variável indentados no bloco
Cntrl D Seleciona palavra, se apertar novamente seleciona a proxíma
Cntrl L Seleciona uma linha toda
Cntrl Alt V Show Minimap
Cntrl W fecha aba que esta selecionada o arquivo
Cntrl seta Up Down scroll window baixo e cima
Cntrl seta left right move select words left or right
Cntrl + or - Zoom
Ctrl PgUp or PgDown Move in files arqs.
Cntrl P Open file in another tab
F1 pula linha sem precisar ir pro final
Cntrl F Find
Cntrl Shift F Acha em tudo Find All, todos os seus arquivos
Cntrl H Substitui
Cntrl ' ' abre terminal
Cntrl Shift O see all functions, vars, etc
Cntrl O open arq
Cntrl N new arq.

Cntrl X RECORTA ao final da linha
Shift tab <--- deslocar indentação
Cntrl ´ <--- deslocar indentação
Cntrl [ ---> deslocal indentação
Cntrl S Salvar arquivo
Cntrl 1 focus editor1
Cntrl 2 focus editor2
Cntrl Shift L select all occurences, ctrl+D melhorado
Cntrl ] split right, jogar uma nova janela a direita
Cntrl Alt R split right

##Terminal:
Cntrl C Execution forcefully stopped.
seta Up ^ last command
Cntrl ' ' abre terminal
Cntrl L clear terminal or clr
Cntrl Shift Y Debug Console
Cntrl Shift U Output Console
Cntrl Shift M Problems Console

---

## <!-- JSON keyboard configs -->

// Place your key bindings in this file to override the defaults
[
{
"key": "shift+f1",
"command": "workbench.action.showCommands"
},
{
"key": "f1",
"command": "-workbench.action.showCommands"
},
{
"key": "f1",
"command": "editor.action.insertLineAfter",
"when": "editorTextFocus && !editorReadonly"
},
{
"key": "ctrl+enter",
"command": "-editor.action.insertLineAfter",
"when": "editorTextFocus && !editorReadonly"
},
{
"key": "alt+f2",
"command": "workbench.debug.panel.action.clearReplAction"
},
{
"key": "alt+f2",
"command": "workbench.output.action.clearOutput"
},
{
"key": "alt+f2",
"command": "notebook.cell.clearOutputs",
"when": "notebookCellHasOutputs && notebookEditorFocused && !inputFocus"
},
{
"key": "alt+delete",
"command": "-notebook.cell.clearOutputs",
"when": "notebookCellHasOutputs && notebookEditorFocused && !inputFocus"
},
{
"key": "alt+f1",
"command": "code-runner.run"
},
{
"key": "ctrl+alt+n",
"command": "-code-runner.run"
},
{
"key": "ctrl+alt+abnt_c1",
"command": "editor.foldAllBlockComments",
"when": "editorTextFocus && foldingEnabled"
},
{
"key": "ctrl+k ctrl+oem_2",
"command": "-editor.foldAllBlockComments",
"when": "editorTextFocus && foldingEnabled"
},
{
"key": "ctrl+abnt_c1",
"command": "editor.action.commentLine",
"when": "editorTextFocus && !editorReadonly"
},
{
"key": "ctrl+oem_2",
"command": "-editor.action.commentLine",
"when": "editorTextFocus && !editorReadonly"
},
{
"key": "ctrl+alt+abnt_c1",
"command": "editor.action.blockComment",
"when": "editorTextFocus && !editorReadonly"
},
{
"key": "shift+alt+a",
"command": "-editor.action.blockComment",
"when": "editorTextFocus && !editorReadonly"
},
{
"key": "alt+e",
"command": "cursorEnd",
"when": "textInputFocus"
},
{
"key": "end",
"command": "-cursorEnd",
"when": "textInputFocus"
},
{
"key": "alt+q",
"command": "cursorHome",
"when": "textInputFocus"
},
{
"key": "home",
"command": "-cursorHome",
"when": "textInputFocus"
},
{
"key": "shift+enter",
"command": "-python.execSelectionInTerminal",
"when": "editorTextFocus && !findInputFocussed && !jupyter.ownsSelection && !notebookEditorFocused && !replaceInputFocussed && editorLangId == 'python'"
},
{
"key": "shift+f2",
"command": "python.execInTerminal"
},

// Toggle between terminal and editor focus
{ "key": "ctrl+0", "command": "workbench.action.terminal.focus" },
{
"key": "ctrl+0",
"command": "workbench.action.focusActiveEditorGroup",
"when": "terminalFocus"
},
{
"key": "ctrl+alt+r",
"command": "workbench.action.splitEditorRight"
},
{
"key": "ctrl+alt+f",
"command": "bookmarks.toggle",
"when": "editorTextFocus"
},
{
"key": "ctrl+alt+k",
"command": "-bookmarks.toggle",
"when": "editorTextFocus"
},
{
"key": "f9",
"command": "-editor.debug.action.toggleBreakpoint",
"when": "debuggersAvailable && editorTextFocus"
},
{
"key": "shift+f9",
"command": "-editor.debug.action.toggleInlineBreakpoint",
"when": "editorTextFocus"
},
{
"key": "ctrl+alt+v",
"command": "editor.action.toggleMinimap"
},
{
"key": "ctrl+shift+alt+p",
"command": "workbench.action.pinEditor",
"when": "!activeEditorIsPinned"
},
{
"key": "ctrl+k shift+enter",
"command": "-workbench.action.pinEditor",
"when": "!activeEditorIsPinned"
},
{
"key": "ctrl+shift+alt+u",
"command": "workbench.action.unpinEditor",
"when": "activeEditorIsPinned"
},
{
"key": "ctrl+k shift+enter",
"command": "-workbench.action.unpinEditor",
"when": "activeEditorIsPinned"
},
{
"key": "ctrl+alt+t",
"command": "copyRelativeFilePath",
"when": "!editorFocus"
},
{
"key": "ctrl+k ctrl+shift+c",
"command": "-copyRelativeFilePath",
"when": "!editorFocus"
},
{
"key": "alt+f1",
"command": "robot.runSuite"
},
{
"key": "alt+oem_102",
"command": "workbench.action.terminal.toggleTerminal",
"when": "terminal.active"
},
{
"key": "ctrl+oem_3",
"command": "-workbench.action.terminal.toggleTerminal",
"when": "terminal.active"
},
{
"key": "alt+oem_3",
"command": "workbench.action.focusFirstEditorGroup"
},
{
"key": "ctrl+1",
"command": "-workbench.action.focusFirstEditorGroup"
}
]

---

## <!-- JSON Configs -->

{
"editor.fontFamily": "'Cascadia Code', IBM Plex Mono",
"editor.fontSize": 16,
"editor.lineHeight": 24,
"editor.letterSpacing": 0.3,
"editor.tabSize": 2,
"editor.tabCompletion": "on",
"editor.wordWrap": "off",
"font_options": "no_italic",
"workbench.activityBar.visible": true,
"liveServer.settings.donotShowInfoMsg": true,
"liveServer.settings.donotVerifyTags": true,
"explorer.confirmDragAndDrop": false,
"diffEditor.renderSideBySide": true,
"editor.formatOnSave": true,
"editor.colorDecorators": false,
"editor.autoClosingBrackets": "always",
"editor.autoClosingQuotes": "always",
"editor.hover.enabled": true,  
 "workbench.startupEditor": "newUntitledFile",
"workbench.list.smoothScrolling": true,
"workbench.editor.pinnedTabSizing": "normal",
"editor.fontLigatures": false,
"git.ignoreMissingGitWarning": true,
"workbench.iconTheme": "material-icon-theme",
"files.autoSave": "afterDelay",
"color-highlight.matchWords": true,
"color-highlight.markerType": "dot-before",
"editor.cursorBlinking": "expand",
"editor.renderWhitespace": "boundary",
"workbench.editor.wrapTabs": true,
"editor.suggestSelection": "first",
"workbench.colorCustomizations": {
"editor.selectionBackground": "#0a424f",
// "editor.selectionHighlightBackground": "#135564",
"editor.findMatchBackground": "#98005D",
"editor.findMatchHighlightBackground": "#191dff",
"editor.lineHighlightBorder": "#03011a",
"editor.selectionHighlightBorder": "#ffffff30",
"editorCursor.foreground": "#00c932",
"editorLineNumber.activeForeground": "#128a1b",
"debugToolBar.background": "#4d3268",
"tab.border": "#a58fa74d",
"tab.activeBackground": "#032F62", // #8b4488a6"
"tab.inactiveBackground":"#0000",
"tab.lastPinnedBorder": "#FFD204",
"sideBar.background": "#03011a", //#032F62 #05264C
"editor.background": "#03011a", //#0D1117 #110221  
 "tab.hoverBackground": "#032F92",
"titleBar.activeBackground": "#06000a",
"sideBar.border": "#ffffff30",
"activityBar.background": "#06000a",
"editorGroupHeader.tabsBackground":"#03011a",
"statusBar.background": "#06000a",
//terminal
// "terminalCursor.background": "#040429", //white background color
"terminalCursor.foreground": "#094A99", //transparent effect //"#040429",
"terminal.background": "#040429",
"terminal.ansiBlack":"#231F20",
"terminal.ansiBlue":"#009DDC",
"terminal.ansiBrightBlack":"#737171",
"terminal.ansiBrightBlue":"#009DDC",
"terminal.ansiBrightCyan":"#85CEBC",
"terminal.ansiBrightGreen":"#00853E",
"terminal.ansiBrightMagenta":"#98005D",
"terminal.ansiBrightRed":"#EE2E24",
"terminal.ansiBrightWhite":"#FFFFFF",
"terminal.ansiBrightYellow":"#FFD204",
"terminal.ansiCyan":"#85CEBC",
"terminal.ansiGreen":"#00853E",
"terminal.ansiMagenta":"#98005D",
"terminal.ansiRed":"#EE2E24",
"terminal.ansiWhite":"#D9D8D8",
"terminal.ansiYellow":"#FFD204",
"editor.ansiYellow":"#FFD204",

    },
    "editor.tokenColorCustomizations": {
        "strings": "#009DDC",
        "comments":"#636F78",
        "keywords": "#f5cc00",
        "variables": "#db4d00",           // "#DA5A53",
        "types": "#14ff81",  //#00853E #f5cc00 #ed4b42 #54ffa3
        "functions": "#886eff", //#009DDC #c99be8 #9d68de #57D5D9  #705ef7  #8086ff
        "textMateRules": [               //tirar italico do tema
            {
              "scope": [
                "comment",
                "comment.block",
                "comment.block.documentation",
                "comment.line",
                "constant",
                "constant.character",
                "constant.character.escape",
                "constant.numeric",
                "constant.numeric.integer",
                "constant.numeric.float",
                "constant.numeric.hex",
                "constant.numeric.octal",
                "constant.other",
                "constant.regexp",
                "constant.rgb-value",
                "emphasis",
                "entity",
                "entity.name",
                "entity.name.class",
                "entity.name.function",
                "entity.name.method",
                "entity.name.section",
                "entity.name.selector",
                "entity.name.tag",
                "entity.name.type",
                "entity.other",
                "entity.other.attribute-name",
                "entity.other.inherited-class",
                "invalid",
                "invalid.deprecated",
                "invalid.illegal",
                "keyword",
                "keyword.control",
                "keyword.operator",
                "keyword.operator.new",
                "keyword.operator.assignment",
                "keyword.operator.arithmetic",
                "keyword.operator.logical",
                "keyword.other",
                "markup",
                "markup.bold",
                "markup.changed",
                "markup.deleted",
                "markup.heading",
                "markup.inline.raw",
                "markup.inserted",
                "markup.italic",
                "markup.list",
                "markup.list.numbered",
                "markup.list.unnumbered",
                "markup.other",
                "markup.quote",
                "markup.raw",
                "markup.underline",
                "markup.underline.link",
                "meta",
                "meta.block",
                "meta.cast",
                "meta.class",
                "meta.function",
                "meta.function-call",
                "meta.preprocessor",
                "meta.return-type",
                "meta.selector",
                "meta.tag",
                "meta.type.annotation",
                "meta.type",
                "punctuation.definition.string.begin",
                "punctuation.definition.string.end",
                "punctuation.separator",
                "punctuation.separator.continuation",
                "punctuation.terminator",
                "storage",
                "storage.modifier",
                "storage.type",
                "string",
                "string.interpolated",
                "string.other",
                "string.quoted",
                "string.quoted.double",
                "string.quoted.other",
                "string.quoted.single",
                "string.quoted.triple",
                "string.regexp",
                "string.unquoted",
                "strong",
                "support",
                "support.class",
                "support.constant",
                "support.function",
                "support.other",
                "support.type",
                "support.type.property-name",
                "support.variable",
                "variable",
                "variable.language",
                "variable.name",
                "variable.other",
                "variable.other.readwrite",
                "variable.parameter"
              ],
              "settings": {
                "fontStyle": ""
              }
            }
          ]
    },

    "[robot]": {
        "editor.defaultFormatter": "tumit.vscode-rf-formatter"
    },
    "workbench.editorAssociations": {
      "*.ipynb": "jupyter.notebook.ipynb"
    },
    "debug.showInlineBreakpointCandidates": false,
    "debug.allowBreakpointsEverywhere": true,
    "terminal.integrated.cursorStyle": "line",
    "terminal.integrated.rightClickBehavior": "selectWord",
    "terminal.integrated.cursorBlinking": true,
    "workbench.colorTheme": "Atom One Dark",
    "window.zoomLevel": -1,
    "editor.minimap.enabled": false,

}

---

## Instalação RobotFramework no S.O. Windows

I) Abrir o terminal e digitar:
pip install robotframework

II) Digite em seguida:
pip install --upgrade robotframework-seleniumlibrary

III) Logo após:
pip install -U robotframework-requests

IV)Para verificar as libraries instaladas:
pip freeze

V) Agora iremos instalar os drivers dos navegadores conforme link a seguir, que devem estar salvos na pasta Scripts (passo V), localizado no diretório do Python na máquina.

obs) Verifique se o navegador está com a mesma versão do driver que irá baixar.

Mozilla:
https://github.com/mozilla/geckodriver/releases

Chrome:
https://chromedriver.chromium.org/

VI) Para localizar a pasta Scripts do Python, digite na busca do windows Python e clique com botão direito para “Abrir local do arquivo”.

VII) Extraia os drivers baixados do Chrome (chromedriver) e Firefox (“geckodriver”) na pasta Scripts

---


## Instalação RobotFramework no MAC

PESQUISAR O ARQUIVO CHROME DRIVE, VER ONDE ESTA INSTALADO O CAMINHO E DPS SALVAR POR CIMA.
# Homebrew 3
brew upgrade chromedriver

# Homebrew < 3
brew cask upgrade chromedriver

brew uninstall chromedriver     
brew install --cask chromedriver
chromedriver --version   

DEMORA UM POUCO

I) Abrir o terminal e digitar:
pip install robotframework

II) Digite em seguida:
pip install --upgrade robotframework-seleniumlibrary

III) Logo após:
pip install -U robotframework-requests

IV)Para verificar as libraries instaladas:
pip freeze

V) Agora iremos instalar os drivers dos navegadores conforme link a seguir, que devem estar salvos na pasta Scripts (passo V), localizado no diretório do Python na máquina.

obs) Verifique se o navegador está com a mesma versão do driver que irá baixar.

Mozilla:
https://github.com/mozilla/geckodriver/releases

Chrome:
https://chromedriver.chromium.org/

VI) Para localizar a pasta Scripts do Python, digite na busca do windows Python e clique com botão direito para “Abrir local do arquivo”.

VII) Extraia os drivers baixados do Chrome (chromedriver) e Firefox (“geckodriver”) na pasta Scripts

---

