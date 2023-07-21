it('visits product detail page of app from home page', () => {
  cy.visit('/')

  cy.get(".products article").should("be.visible")
  cy.get(".products article img").first().click();

})