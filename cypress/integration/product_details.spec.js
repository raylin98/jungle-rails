describe('home page', () => {

  it('can visit the homepage', () => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("lets you visit the first product detail page", () => {
    cy.contains("Giant Tea").click()
    cy.url().should("include", "/products/1")
  })

  it("lets you visit the second product detail page", ()=> {
    cy.visit('/')
    cy.get(".products article").first().click()
    cy.url().should("include", "/products/2")
  })
});