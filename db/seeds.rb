# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{username: 'Jonny',email: 'jonny@aol.com', password: 'password'},{username: 'Joey', email: 'joey@hotmail.com', password: 'notpassword'}])
recipes = Recipe.create([{user_id: 1, name: 'spagetti'}, {user_id: 2, name: 'sandwich'}])
ingredients = Ingredient.create([{name: 'bread'}, {name: 'cheese'}, {name: 'turkey'}, {name: 'spagetti noodles'}, {name: 'spagetti sauce'}])