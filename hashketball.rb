# Write your code here!
require 'pry'

def game_hash
  
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [ 
        {:player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
        },
        {:player_name => "Reggie Evans",
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
        },
        {:player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
        },
        {:player_name => "Mason Plumlee",
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
        },
        {:player_name => "Jason Terry",
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
        }
      ]
      
    },
    
    :away => {
      :team_name => "Charlotte Hornets" ,
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10
        },
        {:player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
        },
        {:player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12
        }
        ]
    }
    
    
  }
  #binding.pry
end


def num_points_scored (players_name)
  #return number of points for player passed in
  # get down to the level of :players
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          if player_info[:player_name] == players_name
            return player_info[:points]
              #binding.pry
          end
          
        end
          
      end
       
    end
  end
  
end



def shoe_size(players_name)
  #returns the shoe size player passed in
  # get down to the level of :players
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          if player_info[:player_name] == players_name
            return player_info[:shoe]
              #binding.pry
          end
          
        end
          
      end
       
    end
  end
end


def team_colors( team_name)
  #returns an array of the team's colors passed in
  game_hash.each do |location, team_data|
    #binding.pry
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end 
  end
end

def team_names
  team_array = []
game_hash.each do |location, team_data|
  team_array << team_data.values[0]
  #binding.pry
  end
  team_array
end

def player_numbers(team_name)
  #returns an array of jersey numbers for the given team
  jersey_nums = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute , data|
        if attribute == :players
          data.each do |player_info|
            jersey_nums << player_info[:number]
            #binding.pry
          end
      
          
        end
      end
    end
  end 
  jersey_nums
end

def player_stats (player_name)
  #returns a hash of given player's stats
  players_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          if player_info[:player_name] == player_name
            players_hash = player_info
            players_hash.shift
             # binding.pry
          end
          
        end
          
      end
       
    end
  end
  
  players_hash
end

def big_shoe_rebounds
# returns the rebound # of the player with the biggest shoe size
  rebound_nums = []
  shoe_size = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
        if attribute == :players
          data.each do |player_info|
            rebound_nums << player_info[:rebounds]
            shoe_size << player_info [:shoe]
            #binding.pry
          end
      
          
        end
      end
    
  end
  rebound_nums[shoe_size.index(shoe_size.max)]
end

def most_points_scored
#returns player with most points scored
  player_array = []
  points_scored = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      if attribute == :players
        data.each do |player_info|
          player_array << player_info[:player_name]
          points_scored << player_info[:points]
        end
      end
    end
  end
    
  player_array[points_scored.index(points_scored.max)]

end


def winning_team
  #team with most points
  home_team_points = []
  home_total = 0
  away_team_points = []
  away_total = 0
  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute , data|
        if attribute == :players
          data.each do |player_info|
            home_team_points << player_info[:points]
            home_total = home_team_points.sum
          end
        end
      end
    else
      team_data.each do |attribute , data|
        if attribute == :players
          data.each do |player_info|
            away_team_points << player_info[:points]
            away_total = away_team_points.sum
          end
        end
      end
      
    end
    
  end 
    if home_total > away_total
      return "Brooklyn Nets"
    else
      return "Charlotte Hornets"
    end
end

def player_with_longest_name
#which player has the longest name
  player_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      if attribute == :players
        data.each do |player_info|
          player_array << player_info[:player_name]
          
        end
      end
    end
  end
    
 player_array.max_by(&:length)
 
end


def long_name_steals_a_ton?
# returns true if the player with the longest name steals a ton
  player_array = []
  steals_made = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute , data|
      if attribute == :players
        data.each do |player_info|
          player_array << player_info[:player_name]
          steals_made << player_info[:steals]
        end
      end
    end
  end
    
  player_array[steals_made.index(steals_made.max)] == player_with_longest_name

end
