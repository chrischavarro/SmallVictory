# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1, user2, user3 = User.create([
	{first_name: "Bob", email: "bob@email.com", password: "bob", password_confirmation: "bob"},
	{first_name: "Tim", email: "tim@email.com", password: "tim", password_confirmation: "tim"},
	{first_name: "George", email: "george@email.com", password: "george", password_confirmation: "george"}
])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'chavarr.christian@gmail.com', password: 'Nintendods55', password_confirmation: 'Nintendods55')