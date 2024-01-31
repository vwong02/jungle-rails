describe('User', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('Create a new user and automatically logs in the new user', () => {
    // reset db for sign up test
    // cy.request('/cypress_rails_reset_state')

    // Go to signup page
    cy.contains('Signup')
      .click()
      .location('pathname').should('eq', '/signup');
    // Fill out signup form
    cy.get('#user_first_name').type('John', { force: true });
    cy.get('#user_last_name').type('Doe');
    cy.get('#user_email').type('test@test.com');
    cy.get('#user_password').type('password');
    cy.get('#user_password_confirmation').type('password');

    // Redirect to home page and automatically logs in user after signup
    cy.get('[name=commit]')
      .click()
      .location('pathname').should('eq', '/');
    cy.contains('Account created successfully')
    cy.get('.nav-greeting').contains('John');

  });
  
  it('Logs in a user when email and password is authenticated and redirects user to home page', () => {
    // Go to log in page
    cy.contains('Login')
      .click()
      .location('pathname').should('eq', '/login');

    // Fill in log in form
    cy.get('#email').type('test@test.com');
    cy.get('#password').type('password');

    // Redirect to home page and automatically logs in user after signup
    cy.get('[name=commit]')
      .click()
      .location('pathname').should('eq', '/');
    cy.get('.nav-greeting').contains('John');
  });

  
});