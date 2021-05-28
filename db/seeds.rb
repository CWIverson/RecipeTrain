# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{username: 'Jonny', password: 'password'},{username: 'Joey', password: 'notpassword'}])
recipes = Recipe.create([{user_id: 1, name: 'spagetti', instructions: 'make the spagetti'}, {user_id: 2, name: 'sandwich', instructions: 'make the dang samich'}])
ingredients = Ingredient.create([{name: 'bread'}, {name: 'cheese'}, {name: 'turkey'}, {name: 'spagetti noodles'}, {name: 'spagetti sauce'}])