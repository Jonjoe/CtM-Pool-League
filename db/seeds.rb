# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!({
    name: "Admin",
    email: "admin@admin.admin",
    role: "admin",
    password: "password"
})

25.times do
    User.create!({
        name: Faker::Name.name,
        email: Faker::Internet.email,
        role: "user",
        password: "password"
    })
end 

3.times do
    league = League.create!({
        name: Faker::Team.name,
        owner_id: User.find(rand(1...User.all.count)).id
    })

    4.times do
        winner = User.find(rand(1...User.all.count)).id
        game = league.games.create!({
            winner_id: winner,
            player1_id: winner,
            player2_id: User.find(rand(1...User.all.count)),
        })
        game.save
    end

    rand(1...5).times do
        league.games.create!({
            winner_id: nil,
            player1_id: User.find(rand(1...User.all.count)),
            player2_id: User.find(rand(1...User.all.count)),
        })
    end
end 

12.times do
    league = League.create!({
        name: Faker::Team.name,
        owner_id: User.find(rand(1...User.all.count)).id
    })

    15.times do
        winner = User.find(rand(1...User.all.count)).id
        game = league.games.create!({
            winner_id: winner,
            player1_id: winner,
            player2_id: User.find(rand(1...User.all.count)),
        })
        game.save
    end

    league.assign_winner
end 
