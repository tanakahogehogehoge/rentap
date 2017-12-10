# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



14.times do |n|
     inst = Inst.new
     inst.user_id = 1
     inst.cost = rand(900..1600)
     inst.info = "ほげほげほげ"
     inst.image = nil
     inst.address = Faker::Address.state
     inst.style = "空きスペース"
     inst.save
end
