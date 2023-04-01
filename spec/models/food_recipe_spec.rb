require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'Recipe model' do
    let(:user) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456') }
    let(:food) { Food.new(user:, name: 'pizza', measurement_unit: 'g', price: '200', quantity: '3') }
    let(:recipe) do
      Recipe.new(user:, name: 'pizza', preparation_time: '3', cooking_time: '2', description: 'it is good',
                 public: true)
    end
    let(:recipefood) { RecipeFood.new(quantity: '3', recipe:, food:) }

    before { recipefood.save }

    it 'check the name is not blank' do
      recipefood.quantity = '3'
      expect(recipefood).to be_valid
    end
  end
end
