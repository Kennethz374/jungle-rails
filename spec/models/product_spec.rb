require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'ensures that a product with all four fields set will indeed save' do
      @category = Category.new(name: "Games")
      @product = Product.create(name: "board game", price: 35, quantity: 40, category: @category)
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category_id).to be_present
      expect(@product.errors.full_messages).not_to be_present
    end

    it 'should have error message if product.name is nil' do
      @category = Category.new(name: "Games")
      @product = Product.create(name:nil, price: 35, quantity: 40, category: @category)
      expect(@product.name).not_to be_present
      expect(@product.errors.full_messages).to be_present
    end

    it 'should have error message if product.price is nil' do
      @category = Category.new(name: "Games")
      @product = Product.create(name:"watch", price: nil, quantity: 40, category: @category)
      expect(@product.price).not_to be_present
      expect(@product.errors.full_messages).to be_present
    end

    it 'should have error message if product.quantity is nil' do
      @category = Category.new(name: "Games")
      @product = Product.create(name:"watch", price: 35, quantity: nil, category: @category)
      expect(@product.quantity).not_to be_present
      expect(@product.errors.full_messages).to be_present
    end

    it 'should have error message if product.category is nil' do
      @category = Category.new(name: "Games")
      @product = Product.create(name:"watch", price: 35, quantity: 40, category: nil)
      expect(@product.category).not_to be_present
      expect(@product.errors.full_messages).to be_present
    end

  end
end
