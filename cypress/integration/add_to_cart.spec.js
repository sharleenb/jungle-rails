it("visits home page of app", () => {
  cy.visit("/");
});

it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
});

it("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 2);
});
it("visit product detail page", () => {
  cy.get(".products article img").first().click()
});
it("adds product to cart and cart increases by 1", () => {
  cy.wait(1000)
  cy.contains("Add").first().click()
});
