# Write your code here!
# require "pry"

def game_hash
 result = {
     :home => { 
         :team_name => "Brooklyn Nets",
         :colors => ["Black", "White"],
         :players => [
             { :player_name => "Alan Anderson",
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3, 
                :blocks => 1, 
                :slam_dunks => 1 }, 
             { :player_name => "Reggie Evans",
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12, 
                :assists => 12, 
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7 },
             { :player_name => "Brook Lopez",
                :number => 11,
                :shoe => 17, 
                :points => 17, 
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15 }, 
             { :player_name => "Mason Plumlee",
                :number => 1,
                :shoe => 19, 
                :points => 26, 
                :rebounds => 11, 
                :assists => 6, 
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5 },
             { :player_name => "Jason Terry",
                :number => 31,
                :shoe => 15, 
                :points => 19,
                :rebounds => 2, 
                :assists => 2, 
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1 }
            ]
      },
     :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
            { :player_name => "Jeff Adrien",
               :number => 4, 
               :shoe => 18, 
               :points => 10,
               :rebounds => 1,
               :assists => 1,
               :steals => 2,
               :blocks => 7,
               :slam_dunks => 2 }, 
            { :player_name => "Bismack Biyombo",
               :number => 0, 
               :shoe => 16, 
               :points => 12, 
               :rebounds => 4, 
               :assists => 7,
               :steals => 22, 
               :blocks => 15, 
               :slam_dunks => 10 },
            { :player_name => "DeSagna Diop",
               :number => 2,
               :shoe => 14,
               :points => 24, 
               :rebounds => 12,
               :assists => 12, 
               :steals => 4, 
               :blocks => 5,
               :slam_dunks => 5 },
            { :player_name => "Ben Gordon",
               :number => 8, 
               :shoe => 15, 
               :points => 33,
               :rebounds => 3, 
               :assists => 2, 
               :steals => 1, 
               :blocks => 1,
               :slam_dunks => 0 },
            { :player_name => "Kemba Walker",
               :number => 33, 
               :shoe => 15, 
               :points => 6, 
               :rebounds => 12,
               :assists => 12, 
               :steals => 7, 
               :blocks => 5, 
               :slam_dunks => 12 }
           ]
     }
 }
 return result
end

def get_players(hash)
    result = []
    hash.each do |home_or_away, team|
        team[:players].each do |player_hash, stat|
            result << player_hash
        end
    end
    return result
end


def num_points_scored(player_name_to_find)
    players = get_players(game_hash)

    players.each do |player_hash|
        if player_hash[:player_name] == player_name_to_find
            return player_hash[:points]
        end
    end
end 

def shoe_size(player_name_to_find)
    players = get_players(game_hash)

    players.each do |player_hash|
        if player_hash[:player_name] == player_name_to_find
            return player_hash[:shoe]
        end
    end
end

def team_colors(team_name)
    game_hash.each do |home_or_away, team|
        if team[:team_name] == team_name
            return team[:colors]
        end
    end
end

def team_names
    game_hash.map do |home_or_away, team|
        team[:team_name]
    end
end
 
def player_numbers(team_name)
    team_numbers_arr = []
    game_hash.each do |home_or_away, team|
        if team[:team_name] == team_name
            team[:players].each do |player_hash|
                team_numbers_arr << player_hash[:number] 
            end
        end
    end
    team_numbers_arr
end

def player_stats(player_name_to_find)
   players = get_players(game_hash)
   players.each do |player_hash|
     if player_hash[:player_name] == player_name_to_find
        player_hash.delete(:player_name)
        return player_hash
     end
   end
end

def big_shoe_rebounds
    players = get_players(game_hash)
    players.each do |player_hash|
        if player_hash[:shoe] >= 19
            return player_hash[:rebounds]
        end 
    end
end 

def most_points_scored
    players = get_players(game_hash)
    player_with_most_points = players[0]
    players.each do |player_hash|
        if player_hash[:points] > player_with_most_points[:points]
            player_with_most_points = player_hash
        end
    end
    return player_with_most_points[:player_name]
end

def winning_team
    home_score = 0
    home_team = game_hash[:home]
    print home_team
    home_team[:players].each do |player_hash|
        home_score += player_hash[:points]
    end
    
    away_score = 0
    away_team = game_hash[:away]
    away_team[:players].each do |player_hash|
        away_score += player_hash[:points]
    end

    if home_score > away_score
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    players = get_players(game_hash)
    player_hash_with_longest_name = players[0]
    players.each do |player_hash|
        if player_hash[:player_name].length > player_hash_with_longest_name[:player_name].length
            player_hash_with_longest_name = player_hash
        end
    end
    return player_hash_with_longest_name[:player_name]
end

def long_name_steals_a_ton?
    if player_with_longest_name
        return true
    end
end 