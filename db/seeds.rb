# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
 email = Faker::Internet.email
 password = "password"
 User.create!(email: email,
              password: password,
              password_confirmation: password,
              uid: SecureRandom.uuid,
              name: "サンプル",
              )
end

1.times do |n|
 user_id = rand(1..User.last.id)
   unless User.find_by(id: user_id) == nil
     inst = Inst.new
     inst.content = "ほげ内容"
     inst.title = "ほげタイトル"
     inst.image = nil
     inst.user_id = user_id
     inst.save

     comment = Comment.new
     comment.inst_id = inst.id
     comment.content = "ほげコメント"
     comment.save
   end
 end
