require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    let(:user) { User.create(name: 'admin', email: 'admin@gmail.com', password: '123456') }

    before { user.save }

    it 'check the name is not blank' do
      user.name = 'admin'
      expect(user).to be_valid
    end

    it 'check the measurement unit is not blank' do
      user.email = 'admin@gmail.com'
      expect(user).to be_valid
    end
  end
end