# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contact.destroy_all
Group.destroy_all
User.destroy_all

user_ids = []
user_ids << User.create(name: "Jhon Doe", email: "jhondoe@test.com", password: "123456").id
user_ids << User.create(name: "Jane Roe", email: "janeroe@test.com", password: "123456").id

p "2 user created"
groups_ids = { user_ids[0] => [], user_ids[1] => []}

groups_ids[user_ids[0]] << Group.create(name: "Client", user_id: user_ids[0]).id
groups_ids[user_ids[0]] << Group.create(name: "Family", user_id: user_ids[0]).id
groups_ids[user_ids[1]] << Group.create(name: "Friend", user_id: user_ids[1]).id
groups_ids[user_ids[1]] << Group.create(name: "Company", user_id: user_ids[1]).id


p "#{groups_ids.count} group created"

group_count = groups_ids.length
number_of_contacts = 60
contacts = []

number_of_contacts.times do |i|
  user_id = user_ids[Random.rand(0...2)]

	new_contact = {
		name: Faker::Name.name,
		email: Faker::Internet.email,
		company: Faker::Company.name,
		phone: Faker::PhoneNumber.cell_phone,
		address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
		group_id: groups_ids[user_id][Random.rand(0...group_count)],
    user_id: user_id
	}
	contacts.push(new_contact)

end

Contact.create(contacts)


p "#{number_of_contacts} contacts created"
