require 'rails_helper'

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true
RSpec.describe Product, type: :model do

before(:each) do
  @category = Category.create(name: "Apparel")
end

  describe "Validations" do

    it "is valid with valid all attributes" do
      product = @category.products.new(
        price: 99.99,
        name: "test",
        quantity: 100
      )
      expect(product).to be_valid
      product.errors.full_messages
    end

    it "is not valid without a name" do
      product = @category.products.new(
        price: 99.99,
        quantity: 100)
      expect(product).to_not be_valid
      product.errors.full_messages

    end

    it "is not valid without a price" do
      product = @category.products.new(
        name: "test",
        quantity: 100)
      expect(product).to_not be_valid
      product.errors.full_messages
    end

    it "is not valid without a quantity" do
      product = @category.products.new(
        name: "test",
        price: 99.99)
      expect(product).to_not be_valid
      product.errors.full_messages
    end

    it "is not valid without a category" do
      product = Product.new(
      name: "test",
      price: 99.99,
      quantity: 100
      )
      expect(product).to_not be_valid
      product.errors.full_messages
    end
  end
end
