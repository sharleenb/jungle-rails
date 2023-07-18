require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it "should save a product with all four fields" do 
      record = Product.new
      category = Category.new

      record.name = 'Sharleen'
      record.price = 10
      category.id = 4
      record.quantity = 2
      record.validate
      category.validate
      record.errors.full_messages
    end
    end
    describe '#name' do
    it 'validates presence of name' do
      record = Product.new
      record.name = '' # invalid state
      record.validate 
      record.errors.full_messages

      record.name = 'Sharleen' # valid state
      record.validate 
      expect(record.errors[:name]).to_not include("can't be blank") # check for absence of error
    end
    end

    describe '#category' do
    it 'validates presence of category' do
      record = Category.new
      record.id = nil # invalid state
      record.validate 
      record.errors.full_messages
   
      record.id = 4 # valid state
      record.validate 
      expect(record.errors[:category]).to_not include("can't be blank") # check for absence of error
    end
    end

    describe '#price' do
    it 'validates presence of price' do
      record = Product.new
      record.price = nil # invalid state
      record.validate 
      record.errors.full_messages
    
      record.price = 10 # valid state
      record.validate 
      expect(record.errors[:price]).to_not include("can't be blank") # check for absence of error
    end
    end

    describe '#quantity' do
    it 'validates presence of quantity' do
      record = Product.new
      record.quantity = nil # invalid state
      record.validate 
      record.errors.full_messages
    
      record.quantity = 2 # valid state
      record.validate 
      expect(record.errors[:quantity]).to_not include("can't be blank") # check for absence of error
    end
    end


  end


