require 'pry'
def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

def num_points_scored(player_name)
  binding.pry
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:player_name]==player_name
       return player[:points]
      end
    end
  end
end


def shoe_size(player_name)
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:player_name]==player_name
       return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team,stats|
    if stats[:team_name]== team_name
    return stats[:colors]
    end

  end
end


def team_names
teams=[]

game_hash.each do |team,stats|
  teams<<  stats[:team_name]

  end
   teams
end

def player_numbers(team_name)
p_numbers=[]

  game_hash.each do |team,stats|
    stats[:players].each do |player|
    if stats[:team_name]== team_name
      p_numbers<<player[:number]
    end
    end
  end
 p_numbers
end

def player_stats(player_name)
p_stats={}
game_hash.each do |team,stats|
  stats[:players].each do |player|
  if player[:player_name]==player_name
    player.delete(:player_name)
    p_stats=player
    end
  end
end
p_stats
end

def big_shoe_rebounds
  shoe=0
  rebound=0
  game_hash.each do |team,stats|
    stats[:players].each do |player|
      if player[:shoe]>shoe
        p shoe=player[:shoe]
        rebound= player[:rebounds]
      end
    end
  end
rebound

end

def most_points_scored
points=0
p_name=''
  game_hash.each do |team,stats|
    stats[:players].each do |player|
      if player[:points]>points
        points=player[:points]
        p_name= player[:player_name]

      end
    end
  end
  p_name
end

def winning_team
points_1=0
points_2=0
team_1="Brooklyn Nets"
team_2="Charlotte Hornets"

  game_hash.each do |team,stats|
    stats[:players].each do |player|
    if stats[:team_name]== "Brooklyn Nets"
      points_1+= player[:points]
    else
      points_2+= player[:points]
    end
    end
    end
  points_1 > points_2 ? team_1 : team_2

end

def player_with_longest_name
name_length=0
p_name=''
game_hash.each do |team,stats|
    stats[:players].each do |player|
  player[:player_name].length
      if player[:player_name].length>name_length
        name_length=player[:player_name].length
        p_name= player[:player_name]

     end
    end
  end
  p_name
end


def long_name_steals_a_ton?
  steals=0
 s_player=''
  game_hash.each do |team,stats|
    stats[:players].each do |player|
      if player[:steals]>steals
        steals=player[:steals]
        s_player= player[:player_name]
      end
    end
  end
  if player_with_longest_name==s_player
  return true
  end
end
