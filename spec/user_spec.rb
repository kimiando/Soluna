require 'rails_helper'

describe User do
  it 'is valid with valid attributes' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a first name' do
    user = FactoryBot.build(:user, first_name: nil)
    expect(user).not_to be_valid
  end
  it 'is not valid without a last name' do
    user = FactoryBot.build(:user, last_name: nil)
    expect(user).not_to be_valid
  end
  it 'is not valid without a nickname' do
    user = FactoryBot.build(:user, nickname: nil)
    expect(user).not_to be_valid
  end
  it 'is not valid without a username' do
    user = FactoryBot.build(:user, user_name: nil)
    expect(user).not_to be_valid
  end
  it 'is not valid without a bio' do
    user = FactoryBot.build(:user, bio: nil)
    expect(user).not_to be_valid
  end

  it 'allows saving with nil attributes when using save(validate: false)' do
    user = FactoryBot.build(:user, email: nil, password: nil, nickname: nil, user_name: nil, bio: nil)
    expect { user.save(validate: false) }.to change(User, :count).by(1)
  end
end
