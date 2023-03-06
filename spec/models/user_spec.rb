require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  it '.generate_api_key' do
    user = User.create!(name: 'Jeff', email: 'jeff@gmail.com')

    expect(user.api_key.length).to eq(32)
    expect(user.generate_api_key).to be_a(String)
    expect(user.generate_api_key).to_not eq(user.generate_api_key)
  end
end
