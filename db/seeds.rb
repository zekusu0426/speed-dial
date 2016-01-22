# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Bookmark.delete_all

# 管理者ユーザ初期設定
User.create(email: 'admin@admin.com',
            role: 'admin',
            password: '11111111',
            password_confirmation: '11111111')


# ダミーデータ

User.transaction do
  30.times do
    user = User.create(email: Faker::Internet.email,
                       password: "11111111",
                       password_confirmation: "11111111")
    Bookmark.transaction do
      rand(5..12).times do
        user.bookmarks.create(title: Faker::Lorem.word,
                              url: Faker::Internet.url,
                              image: Faker::Avatar.image)
      end
    end
  end
end