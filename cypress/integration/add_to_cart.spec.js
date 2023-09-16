describe("add_to_cart function", () => {
  it('can visit the homepage', () => {
    cy.visit('/')
  })

  it('visit product 1 page and adding item to cart should change cart count to 1', () => {
    cy.visit('/products/1')

    cy.contains('My Cart (0)')

    cy.get('Button')
    .contains('Add')
    .click({force:true})

    cy.contains('My Cart (1)')
  })

  it('visit product 1 and 2 page and adding both items to cart should change cart count to 2', () => {
    cy.visit('/products/1')

    cy.contains('My Cart (0)')

    cy.get('Button')
    .contains('Add')
    .click({force:true})

    cy.contains('My Cart (1)')

    cy.visit('/products/2')

    cy.contains('My Cart (1)')

    cy.get('Button')
    .contains('Add')
    .click({force:true})

    cy.contains('My Cart (2)')
  })
})