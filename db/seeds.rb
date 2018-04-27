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

User.create!({
    name: "User",
    email: "user@user.user",
    role: "user",
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


User.create!({
    name: "Jonjoe Whitfield",
    email: "me@jonjoe.io",
    role: "user",
    password: "password"
})

User.create!({
    name: "Freddie Fallon",
    email: "wdwe@wdfwe.qwefqwef",
    role: "user",
    password: "password"
})

User.create!({
    name: "Mary Salemne",
    email: "wdwe@stuff.qwefqwef",
    role: "user",
    password: "password"
})

User.create!({
    name: "Francios Something",
    email: "qwerty@stuff.qwefqwef",
    role: "user",
    password: "password"
})

User.create!({
    name: "James Ransome",
    email: "qwerty@stuff.ransome",
    role: "user",
    password: "password"
})

User.create!({
    name: "Matt Something",
    email: "matt@something.ransome",
    role: "user",
    password: "password"
})

# Ongoing Leagues
3.times do
    league = League.create!({
        name: Faker::Team.name,
        owner_id: User.find(rand(1...User.all.count)).id
    })

    2.times do
        winner = User.find(rand(1...User.all.count)).id
        game = league.games.create!({
            winner_id: winner,
            player1_id: winner,
            player2_id: User.find(rand(1...User.all.count)).id,
        })
        game.save
    end

    rand(1...3).times do
        league.games.create!({
            winner_id: nil,
            player1_id: User.find(rand(1...User.all.count)).id,
            player2_id: User.find(rand(1...User.all.count)).id,
        })
    end
end 

# Completed Leagues
12.times do
    league = League.create!({
        name: Faker::Team.name,
        owner_id: User.find(rand(1...User.all.count)).id
    })

    5.times do
        winner = User.find(rand(1...User.all.count)).id
        game = league.games.create!({
            winner_id: winner,
            player1_id: winner,
            player2_id: User.find(rand(1...User.all.count)).id,
        })
        game.save
    end

    league.assign_winner
end 

# Archived Leagues
3.times do
    league = League.create!({
        name: Faker::Team.name,
        owner_id: User.find(rand(1...User.all.count)).id,
        archived: true
    })

    2.times do
        winner = User.find(rand(1...User.all.count)).id
        game = league.games.create!({
            winner_id: winner,
            player1_id: winner,
            player2_id: User.find(rand(1...User.all.count)).id,
        })
        game.save
    end

    rand(1...3).times do
        league.games.create!({
            winner_id: nil,
            player1_id: User.find(rand(1...User.all.count)).id,
            player2_id: User.find(rand(1...User.all.count)).id,
        })
    end
end  


