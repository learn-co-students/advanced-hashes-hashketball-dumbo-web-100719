require 'pry'
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"], 
      players: [
      {name:"Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
      }, 
      away: {
        team_name: "Charlotte Hornets", 
        colors: ["Turquoise", "Purple"], 
        players: [
        {name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        {name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
        ]
        }
    }
end

def num_points_scored(player)

  game_hash.each do |home_or_away, stats|
  
   stats[:players].each do |hash|
     if hash[:name] == player
     return hash[:points]
     
    end
   end
  end
 
end


def shoe_size (player)
  game_hash.each do |home_or_away, stats|
  
   stats[:players].each do |hash|
     if hash[:name] == player
     return hash[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |key, value|
    if value[:team_name] == team
    return value[:colors]
      end
  end

end


def team_names()
game_hash.collect do |key, value|
 value[:team_name]
end
end

def player_numbers(team)
  hash= game_hash.collect do |home_or_away, stats| 
    
    if stats[:team_name] == team
        
      stats[:players].collect do |hash|
       hash[:number]
    end
  end
  end
   hash.compact.flatten 
end

def player_stats(player)
    game_hash.each do |home_or_away, stats|
   stats[:players].each do |hash|
     if hash[:name] == player
     hash.shift
     return hash
      end
    end
  end
end


def big_shoe_rebounds()

result= game_hash.collect do |home_or_away, stats|
 
  stats[:players].collect do |hash|
     
    hash[:shoe]
    end
  end
  
    largest_shoe_size = result.flatten.sort.last
    largest_shoe_size
  game_hash.each do |home_or_away, stats|
    stats[:players].each do |hash|
      if hash[:shoe] == largest_shoe_size
        return hash[:rebounds]
       
  end
    end
  end
end



