// SL_login&buy.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test

/// <reference types="Cypress" />
import { LoginPageclass } from '../pageobjects/objects'

let loginPage = new LoginPageclass()

it('Acesso de login e logout', function () {
    //Logar com dados mais privados que estão no page_objects
    loginPage.navigate();
    loginPage.loginAcess();

    //Conferir se estou realmente na página de Produtos
    cy.get('.title').should('contain', 'Products')
    cy.get('[data-test="product_sort_container"]').should('be.visible')

    // Filtrar
    cy.wait(1000)
    cy.get('[data-test="product_sort_container"]').select('Price (low to high)');

    // Adicionar produtos
    cy.get('#add-to-cart-sauce-labs-onesie').click()
    cy.wait(1000)
    cy.get('[data-test="add-to-cart-test.allthethings()-t-shirt-(red)"]').click()

    // Acessar carrinho
    cy.get('.shopping_cart_link').click()

    //Conferir se estou realmente do carrinho e revisar itens selecionados
    cy.get('.title').should('contain', 'Your Cart')
    cy.get('#item_2_title_link > .inventory_item_name').should('contain', 'Sauce Labs Onesie')
    cy.get('#item_3_title_link > .inventory_item_name').should('contain', 'Test.allTheThings() T-Shirt (Red)')

    // Finalizar Compra, com dados mais privados que estão no page_objets
    cy.get('#checkout').click()

    //forcei a aparecer o error, digitando só o primeiro campo obrigatório
    cy.get('#first-name').type('dsadasd')
    cy.get('#continue').click()
    cy.get('[data-test="error"]').contains('Error: Last Name is required')
    cy.wait(1000)

    //correto
    loginPage.checkoutInformation()

    // Conferir se irá aparecer Payment.. Shipping.. Informations
    cy.get('.summary_info > :nth-child(1)').should('contain', 'Payment')
    cy.get('.summary_info > :nth-child(3)').should('contain', 'Shipping')

    cy.get('#finish').click()

    // Retornar página de conclusão e agradecimento
    cy.get('.complete-header').should('contain', 'THANK YOU FOR YOUR ORDER')
    cy.get('#back-to-products').should('contain', 'Back Home')
    cy.wait(2000)
    cy.get('#back-to-products').click()


    
    // Observações :
    // Back to home esta retornando a tela de produtos.
    // Tempo de execução 08.55 , daria para diminuir para 03.40 sem causar erro tirar os wait, coloquei só para demonstrar o teste rodando para algum usuário. 
    // O Robot Framework com Selenium, costuma não acompanhar o tempo de execução do teste e se perde algumas vezes, o Cypress achei com essa performance melhor. Vantagens e desvantagens em cada ferramenta

})