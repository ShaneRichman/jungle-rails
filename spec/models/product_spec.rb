require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new
      @product.name = "Spy shoes"
      @product.price = 55.2
      @product.quantity = 16
      @product.category = cat1
    end

    it 'should validate with full specs' do
      expect(@product).to be_valid
    end
    it 'should not validate when empty name' do
      @product.name = nil
      expect(@product).not_to be_valid
    end
    it 'should not validate when empty price' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
    end
    it 'should not validate when empty quantity' do
      @product.quantity = nil
      expect(@product).not_to be_valid
    end
    it 'should not validate when empty category' do
      @product.category = nil
      expect(@product).not_to be_valid
    end
  end
end