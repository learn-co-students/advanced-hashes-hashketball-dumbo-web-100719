require "pry"
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{
        "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      }
      },{
        "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7 
      }
      },{
        "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15 
      }
      },{
        "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5 
      }
      },{
        "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1 
      }
      }]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{
        "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2 
      }
      }, {
        "Bismack Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10 
      }
      }, {
        "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5 
      }
      }, {
        "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0 
      }
      }, {
        "Kemba Walker" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12 
      }
      }]
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(players_name)
  score = 0
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |(name_hash)|
      name_hash.each do |name_key, name_stats|
        if name_key == players_name
          score = name_stats[:points]
        end
      end
    end
  end
  score
end

def shoe_size(players_name)
  player_size = 0
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |(name_hash)|
      name_hash.each do |name_key, name_stats|
        if name_key == players_name
          player_size = name_stats[:shoe]
        end
      end
    end
  end
  player_size
end

def team_colors(team)

  game_hash.each do |location, location_hash|
    if location_hash[:team_name] == team
      return location_hash[:colors]
    end
  end
end

def team_names
  team_named = []
  game_hash.each do |location, location_hash|
    if location_hash[:team_name]
      team_named.push(location_hash[:team_name])
    end
  end
  team_named
end


def player_numbers(passed_name)
  number_array = []
  game_hash.each do |location, location_hash|
    
    playas = location_hash[:players]
    playas.each do |(name_hash)|
      name_hash.each do |name_key, name_stats|
        
        if location_hash[:team_name] == passed_name
          number_array.push(name_stats[:number])
        end
      end
    end
  end
  number_array
end

def player_stats(passed_player)
  
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |(name_hash)|
      name_hash.each do |name_key, name_stats|
        
        if name_key == passed_player
          return name_stats
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  largest_name = ""
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |name_hash|
      name_hash.each do |(name, stat_hash)|
        shoe_size = stat_hash[:shoe]
        if shoe_size > largest_shoe
          largest_shoe = shoe_size
          largest_name = name
        end
      end
    end
  end
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |name_hash|
      name_hash.each do |name, stats|
        if name == largest_name
          return name_hash[name][:rebounds]
        end
    end
    end
  end
end

def most_points_scored
  largest_score = 1
  scorer_name = ""
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |name_hash|
      name_hash.each do |(name, stat_hash)|
        if stat_hash[:points] > largest_score
          largest_score = stat_hash[:points]
          scorer_name = name
        end
      end
    end
  end
  scorer_name
end

def winning_team 
  brooklyn_score = 0
  charlotte_score = 0
  game_hash.each do |location, location_hash|
    
    team = location_hash[:team_name]
    playas = location_hash[:players]
    
    if team == "Brooklyn Nets"
    playas.each do |name_hash|
      name_hash.each do |(name, stat_hash)|
        scores = stat_hash[:points]
         brooklyn_score += scores
      end
    end
    end
    if team == "Charlotte Hornets"
    playas.each do |name_hash|
      name_hash.each do |(name, stat_hash)|
        scores = stat_hash[:points]
         charlotte_score += scores
       end
    end
    end
  end
  if brooklyn_score > charlotte_score
  return "Brooklyn Nets"
else
  return "Charlotte Hornets"
end
end

def player_with_longest_name
  counter = 0
  largest_name = ""
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |name_hash|
      name_hash.each do |(name, stat_hash)|
        if name.length > counter
          counter = name.length
          largest_name = name
        end
      end
    end
  end
  largest_name
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  
  largest_steal = 1
  stealer_name = ""
  game_hash.each do |location, location_hash|
    playas = location_hash[:players]
    playas.each do |name_hash|
      name_hash.each do |(name, stat_hash)|
        if stat_hash[:steals] > largest_steal
          largest_steal = stat_hash[:steals]
          stealer_name = name
        end
      end
    end
  end
  if long_name == stealer_name
    return true
  else
    return false
  end
end