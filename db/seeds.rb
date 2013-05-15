# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


sam = User.create(full_name: "samskies", email: "samsamskies@gmail.com")
sidney = User.create(full_name: "sidney", email: "sidney@gmail.com")


Meme.create(url: "www.google.com", creator: sam)
