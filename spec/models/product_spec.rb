require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves a product successfully' do
      @category = Category.new({name: 'randomitem'})
      @product = @category.products.new({name: 'randomitem', price: 200, quantity: 10}).save
      expect(@product).to eq(true)
    end

    it 'is not valid without a name' do
      @category = Category.new({name: 'randomitem'})
      @product = @category.products.new({name: nil, price: 200, quantity: 10})
      expect(@product).to_not be_valid
    end

    it 'is not valid without a price' do
      @category = Category.new({name: 'randomitem'})
      @product = @category.products.new({name: 'randomitem', quantity: 10})
      expect(@product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @category = Category.new({name: 'randomitem'})
      @product = @category.products.new({name: 'randomitem', price: 200, quantity: nil})
      expect(@product).to_not be_valid
    end

    it 'is not valid without a category' do
      @product = Product.new({name: 'randomitem', price: 200, quantity: 10})
      expect(@product).to_not be_valid
    end

  end
end
