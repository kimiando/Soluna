
FactoryBot.define do
    factory :user do
      first_name { 'John' }
      last_name  { 'Doe' }
      email      { 'john.doe@example.com' }
      password   { 'password123' }
      nickname   { 'johndoe' }
      user_name  { 'john_doe' }
      bio        { 'A short bio about John Doe' }
  end
end
