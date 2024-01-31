describe("User", () => {

  beforeEach(() => {
    cy.visit('/');
    // cy.request('/cypress_rails_reset_state') // set to reset db
  });

  it('Create a new user and automatically logs in the new user', () => {

    // Go to signup page
    cy.contains('Signup')
      .click()
      .location('pathname').should('eq', '/signup');

    // Fill out signup form
    cy.get('[name="user[first_name]"]').type("John", { force: true });
    cy.get('[name="user[last_name]"]').type("Doe");
    cy.get('[name="user[email]"]').type('test@test.com');
    cy.get('[name="user[password]"]').type('password');
    cy.get('[name="user[password_confirmation]"').type('password');

    // Redirect to home page and automatically logs in user after signup
    cy.get('[name=commit]')
      .click()
      .location('pathname').should('eq', '/');
    cy.get(".nav-greeting").contains("John");
  });

});