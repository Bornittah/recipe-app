require 'rails_helper'
require 'capybara/rspec'

Capybara.default_driver = :selenium

RSpec.describe 'Food', type: :feature do
  subject do
    @user = User.create(name: 'Joshua', email: 'joshua@gmail.com', password: '123456789')
    @food = Food.create(name: 'Jollof rice', user_id: @user.id, measurement_unit: 'kilograms', price: 25, quantity: 1)
  end

  describe 'validations' do
    it 'is not valid without a name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end

    it 'name should not be longer than 70 characters' do
      food = Food.new(name: 'Jollof' * 16)
      expect(food).to_not be_valid
    end

    it 'is not valid without a user_id' do
      food = Food.new(user_id: nil)
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      food = Food.new(measurement_unit: nil)
      expect(food).to_not be_valid
    end

    it 'should have a number for measurement_unit' do
      food = Food.new(measurement_unit: 'grams')
      expect(food).to_not be_valid
    end

    it 'is not valid without a price' do
      food = Food.new(price: nil)
      expect(food).to_not be_valid
    end

    it 'should be a number(price)' do
      food = Food.new(price: '9')
      expect(food).to_not be_valid
    end
  end
end
