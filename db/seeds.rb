# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "kohei-yamahana",
            email: "kohei@book.com",
            password: "yamahana",
            password_confirmation: "yamahana",
              admin: true,)

99.times do |n|
  name = Faker::Name.name
  email = "kohei#{ n + 1 }@book.com"
  password = "yamahana"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end  

99.times do |n|
Book.create!(googlebooksapi_id: "ooDXyAEACAAJ",
             title: "夏目友人帳 10",
             author: "緑川ゆき",
             image: "http://books.google.com/books/content?id=syZ-DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
             page_count: 192,
             category: 1,
             user_id: n + 1)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each {|user|Review.create!(word_count: 1000,
                                  content: content,
                                  rate: 4,
                                  user_id: user.id,
                                  book_id: 2,
                                  created_at: 1.days.ago)}
end
Review.create(word_count: 1000,content: content,rate: 4,user_id: user.id,book_id: 1,created_at: 3.days.ago)

users = User.all
user = users.first
following = users[2..50]
followers = users[2..50]
following.each{ |followed| user.follow(followed)}
followers.each{ |follower| follower.follow(user)}