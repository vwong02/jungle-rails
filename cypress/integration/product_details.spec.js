describe('product details page', () => {

  it('can visit the selected product detail page', () => {
    cy.visit('/')
    cy.get(".products article").first().click()
    cy.url().should("include", "/products/4")
  })

});