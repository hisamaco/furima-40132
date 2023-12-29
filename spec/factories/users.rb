FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '胃そノ' }
    first_name            { 'カつ尾' }
    last_name_kana        { 'イソノ' }
    first_name_kana       { 'カツオ' }
    birthday              { '2000-01-01' }
  end
end
