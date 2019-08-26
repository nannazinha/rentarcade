# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.destroy_all

puts "Items: #{Item.count}"

5.times do |n|
  new_item = Item.new(
    category: ["Console", "Game"].sample,
    console_model: Faker::Game.platform,
    game_title: Faker::Game.title,
    user_id: 1,
    price: (100..1000).to_a.sample
  )
  if new_item.category == "Console"
    new_item.game_title = ""
  end

  if new_item.save
    puts "Save deu certo"
  else
    puts "Deu ruim no item #{n}"
  end
end

puts "Foram criados #{Item.count} itens"
