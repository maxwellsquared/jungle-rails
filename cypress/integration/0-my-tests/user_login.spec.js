/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/');
  });



  it("Can create a user", () => {
    cy.get("a").contains("Signup").click();
    cy.get("#user_name").type('Bob Loblaw');
    cy.get('#user_email').type('bob@loblaw.com');
    cy.get('#user_password').type('123456');
    cy.get('#user_password_confirmation').type('123456');
    cy.get('input').contains('Submit').click();
  });

  it("Can log in as a user", () => {
    cy.get("a").contains("Login").click();
    cy.get('#email').type('bob@loblaw.com');
    cy.get('#password').type('123456');
    cy.get('input').contains('Submit').click();
    cy.get('a').contains('Logout').should('be.visible');

  });


});