require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: 'Example Category')
      @product = Product.new(name: 'Example Product', price_cents: 19.99, quantity: 5, category: @category)
      expect(@product).to be_valid
    end

    it 'successfully saves with presence of name, price, quantity, and category ' do
      expect(@product.save).to be true
    end

    it 'validate presense of name' do
      @product.name = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validate presense of price' do
      @product.price_cents = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include('Price is not a number', 'Price cents is not a number')
    end

    it 'validate presense of quantity' do
      @product.quantity = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validate presense of category' do
      @product.category = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include('Category must exist', "Category can't be blank")
    end
  end
end
