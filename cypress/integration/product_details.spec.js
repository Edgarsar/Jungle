describe("Product details Page", () => {

  it("Should visit root", () => {
    cy.visit("/")
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Click on the second product", ()=>{
    cy.get('[alt="Scented Blade"]').click();
    cy.get(".product-detail").should("be.visible");
  });

   
  });