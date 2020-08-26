# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_count = 3
message_count = 1000
room_count = 2

ApplicationRecord.transaction do
  # テストユーザーが無ければ作成
  user_count.times do |n|
    User.find_or_create_by!(email: "test#{n + 1}@example.com") do |user|
      user.password = 'password'
      user.nickname = Faker::JapaneseMedia::OnePiece.character
    end
  end

  room_count.times do |n|
    Room.create! do |room|
      room.name = Faker::JapaneseMedia::OnePiece.sea
    end
  end

  # メッセージを全消去した上で，サンプルメッセージを作成。メッセージを作成したユーザーはランダムに決定する
  Message.destroy_all
  user_ids = User.ids
  room_ids = Room.ids
  message_list = []
  message_count.times do |n|
    user_id = user_ids.sample
    room_id = room_ids.sample
    line_count = rand(1..4)
    # Fakerで１〜４行のランダムメッセージを作成
    content = Faker::Lorem.paragraphs(number: line_count).join("\n")
    message_list << { user_id: user_id, content: content, room_id: room_id}
  end
  Message.create!(message_list)
end
puts '初期データの追加が完了しました！'
