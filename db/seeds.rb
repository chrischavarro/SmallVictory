# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1, user2, user3 = User.create([
	{name: "Bob", email: "bob@email.com", password: "bob", password_confirmation: "bob"},
	{name: "Tim", email: "tim@email.com", password: "tim", password_confirmation: "tim"},
	{name: "George", email: "george@email.com", password: "george", password_confirmation: "george"}
])