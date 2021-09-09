# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |n|
  gimei = Gimei.new
  User.create(
    email: "test#{n}@gmail.com",
    password: "111111",
    last_name: gimei.name.last.kanji,
    last_name_kana: gimei.name.last.katakana,
    first_name: gimei.name.first.kanji,
    first_name_kana: gimei.name.first.katakana,
    nickname: gimei.name.kanji,
    start_weight: 60,
    goal_weight: 55,
    start_fat: 20,
    age: 25,
    height: 165,
    self_introduction: "よろしくお願いします。"
  )
end
