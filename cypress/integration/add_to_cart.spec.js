describe("Add to Cart ", () => {

  it("Should visit root", () => {
    cy.visit("/")
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("By Clicking Add to Cart' button cart increases by one", ()=>{
    cy.contains("My Cart (0)");
    cy.contains("Add").click({ force: true });
    cy.contains("My Cart (1)");
    cy.contains("My Cart (0)").should('not.exist')
     
  });
   
  });