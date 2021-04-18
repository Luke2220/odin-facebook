# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create!(username: 'Dave', email: 'dave@fake.com', password: 'davespassword')
User.create(username: 'Ice', email: 'Ice@fake.com', password: 'Icespassword')
User.create(username: 'Bob', email: 'Bob@fake.com', password: 'Bobspassword')
