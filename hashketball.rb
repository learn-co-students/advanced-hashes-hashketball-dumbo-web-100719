# require_relative 'print_bug'
require 'pry'

def game_hash
  {
      :home => {
          :team_name => "Brooklyn Nets",
          :colors => ["Black", "White"],
          :players => {
              "Alan Anderson" => {
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
              },
              "Reggie Evans" => {
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
              },
              "Brook Lopez" => {
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
              },
              "Mason Plumlee" => {
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
              },
              "Jason Terry" => {
                  :number => 31,
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
              }
          }
      },
      :away => {
          :team_name => "Charlotte Hornets",
          :colors => ["Turquoise", "Purple"],
          :players => {
              "Jeff Adrien" => {
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2
              },
              "Bismack Biyombo" => {
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10
              },
              "DeSagna Diop" => {
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
              },
              "Ben Gordon" => {
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
              },
              "Kemba Walker" => {
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12
              }
          }
      }
  }
end

def search_game_hash(team_info, player_info, attr_info)
  game_hash.each do |location, team|

    attr_val_bool = false

    team.each do |team_attribute, val|

      if team_attribute === :team_name
        if val === team_info
          attr_val_bool = true
        end
      end

      if team_attribute === attr_info && attr_val_bool
        # p "-----------------------------"
        # p val
        # p team_info
        # p "-----------------------------"
        return val
      end


      if team_attribute === :players
        val.each do |player_name, stats|
          if player_name === player_info
            return stats[attr_info]
          end
        end
      end

    end # end-of-team.each
  end # end-of-game_hash.each
end

def num_points_scored(players_name)
  search_game_hash(false, players_name, :points)
end

def shoe_size(players_name)
  search_game_hash(false, players_name, :shoe)
end

def team_colors(team_name)
  search_game_hash(team_name, false, :colors)
end

def team_names
  names = []
  names << search_game_hash("Brooklyn Nets", false, :team_name)
  names << search_game_hash("Charlotte Hornets", false, :team_name)
  names
end

def player_numbers(team_name)
  jersey_numbers = []

  game_hash.each do |location, team|
    if game_hash[location].values.include?(team_name)
      team.each do |team_attribute, team_info|
        if team_info.class == Hash
          team_info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :number
                jersey_numbers << int.to_i
              end
            end
          end
        end
      end
    end
  end

  jersey_numbers
end

def player_stats(player_name)

  player_stats = {}

  game_hash.each do |location, team|
    team.each do |team_attribute, team_info|
      if team_attribute == :players
        if team_info.keys.include?(player_name)
          player_stats = team_info[player_name]
        end
      end
    end
  end


  return player_stats
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0

  game_hash.each do |location, team|
    team.each do |team_attribute, team_info|
      if team_attribute == :players
        team_info.each do |player_name, player_stats|
          if player_stats[:shoe] > largest_shoe
            largest_shoe = player_stats[:shoe]
            rebounds = player_stats[:rebounds]
          end
        end
      end
    end
  end

  rebounds
end


def most_points_scored

  most_points = 0
  top_scorer = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, team_info|
      if team_attribute == :players
        team_info.each do |player_name, player_stats|
          if player_stats[:points] > most_points
            most_points = player_stats[:points]
            top_scorer = player_name
          end
        end
      end
    end
  end

  top_scorer
end


def winning_team
  home = 0
  away = 0

  game_hash.each do |location, team|
    team.each do |team_attribute, team_info|

      if location == :home
        if team_attribute == :players
          team_info.each do |player_name, player_stats|
            home += player_stats[:points]
          end
        end
      end

      if location == :away
        if team_attribute == :players
          team_info.each do |player_name, player_stats|
            away += player_stats[:points]
          end
        end
      end
    end
  end

  team_won = ""

  if home > away
    team_won = game_hash[:home][:team_name]
  else
    team_won = game_hash[:away][:team_name]
  end
end


def player_with_longest_name

  longest_name = 0
  player = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, team_info|
      if team_attribute == :players
        team_info.each do |player_name, player_stats|
          if player_name.length > longest_name
            longest_name = player_name.length
            player = player_name
          end
        end
      end
    end
  end

  player
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  longest_name_steals = 0

  most_steals = 0
  player = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, team_info|
      if team_attribute == :players
        team_info.each do |player_name, player_stats|
          if player_stats[:steals] > most_steals
            most_steals = player_stats[:steals]
            player = player_name
          end

          if longest_name == player_name
            longest_name_steals = player_stats[:steals]
          end

        end
      end
    end
  end

  top_steal_player = nil

  if longest_name_steals >= most_steals
    top_steal_player = true
  else
    top_steal_player = false
  end

  top_steal_player
end