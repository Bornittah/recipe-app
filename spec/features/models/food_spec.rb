require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food model' do
    let(:user) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456') }
    let(:food) { Food.new(user:, name: 'pizza', measurement_unit: 'g', price: '200', quantity: '3') }

    before { food.save }

    it 'check the name is not blank' do
      food.name = nil
      expect(food).to_not be_valid
    end

    it 'check the measurement unit is not blank' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end

    it 'check the price is not blank' do
      food.price = '200'
      expect(food).to be_valid
    end
  end
end