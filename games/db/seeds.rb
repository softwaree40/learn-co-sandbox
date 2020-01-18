15.times do
  Game.create(title: Faker::Game.unique.title )
end
