describe('add to cart feature', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('add a product to the cart from the home page', () => {
    cy.get(".cart-nav-link").contains("0")
    cy.get(".add-to-cart-btn:not([disabled])").click({ force: true });
    cy.get(".cart-nav-link").contains("1");
  })

  it('add a product to the cart from the selected prodcut details page', () => {
    cy.get(".products article").first().click()
    cy.url().should("include", "/products/2")

    cy.get(".cart-nav-link").contains("0")
    cy.get(".add-to-cart-btn:not([disabled])").click({ force: true });
    cy.get(".cart-nav-link").contains("1");
  })

});
