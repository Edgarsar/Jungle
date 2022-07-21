require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(name: "Flowers")
    end

    it "product saves successfully with all four fields set" do
     @product = Product.new(
        name: "Lily",
        price_cents: 20.99,
        quantity: 23,
        category: @category
      )

        @product.save
        expect(@product).to be_valid
        expect(@product.errors.full_messages).to be_empty
    end

    it "product should have a name " do
      @product = Product.new(
        name: nil,
        price_cents: 20.99,
        quantity: 23,
        category: @category
      )
      @product.save

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Name can't be blank"
        expect(@product.errors.full_messages.length).to be(1)
    end

    it "product should have a price " do
      @product = Product.new(
        name: "Lily",
        price_cents: nil,
        quantity: 23,
        category: @category
      )
        @product.save

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "product should have a quantity " do
      @product = Product.new(
        name: "Lily",
        price_cents: 12.99,
        quantity: nil,
        category: @category
      )
        @product.save

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
        expect(@product.errors.full_messages.length).to be(1)
    end

    it "product should have a category " do
      @product = Product.new(
        name: "Lily",
        price_cents: 12.99,
        quantity: 14,
        category: nil
      )
        @product.save

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Category can't be blank"
        expect(@product.errors.full_messages).to include "Category must exist"
        expect(@product.errors.full_messages.length).to be(2)
    end

  end
end