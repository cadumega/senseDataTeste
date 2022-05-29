export class LoginPageclass {

    navigate() {
    cy.visit('https://www.saucedemo.com/',{timeout:12000})
    }

    loginAcess() {
        cy.get('#user-name').type('standard_user')
        cy.get('#password').type('secret_sauce{enter}')
        // cy.get('#login-button').click()
    }

    checkoutInformation() {
        cy.get('#first-name').type('Carlos')
        cy.get('#last-name').type('Teste')
        cy.get('#postal-code').type('12345')
        cy.get('#continue').click()
    }
}


// Criando classes separadas para cada página
// Acessando objeto que poderei usar em qualquer página, vinculando com as classes criadas.