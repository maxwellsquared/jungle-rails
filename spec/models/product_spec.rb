require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.new(id: 37)
      @product = Product.new(name: "Yum yums", category_id: @category.id, quantity: 7, price_cents: 1700)
    end

    it 'should have a name' do
      expect(@product.name).to be_present
    end

    it 'should have a category_id' do
      expect(@product.category_id).to be_present
    end

    it 'should have a quantity' do
      expect(@product.quantity).to be_present
    end

    it 'should have a price' do
      expect(@product.price_cents).to be_present
    end

    # -----

    it 'should be sad when everything but the validation field (name) is set' do
      @product_two = Product.new(category_id: @category.id, quantity: 7, price_cents: 1700)
      @product_two.save
      expect(@product_two.errors.full_messages).to include("Name can't be blank")
      # expect(@product_two.name).to be_present
    end
  end
end