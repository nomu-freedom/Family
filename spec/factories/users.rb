FactoryBot.define do
  factory :user do
    nickname              {Faker::JapaneseMedia::OnePiece.character}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
