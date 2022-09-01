/// <reference types="cypress" />

describe('add to cart', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/');
  });

  it('Can see the logo', () => {
    cy.get('.navbar-brand').should('have.text', 'Jungle');
  });

  it("Can visit the right product detail page", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
    cy.get(".product-detail h1").should("have.text", "Scented Blade");
    cy.get('.btn').click();
    cy.get('a').contains("My Cart (1)").should("be.visible");
  });

  // click add to cart
  // cart should increase by one
});