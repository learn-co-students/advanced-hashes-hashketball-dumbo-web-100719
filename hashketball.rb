:players => {
          :name => [ "Dillion Hayes", "RTrevor Manley", "Dwayne McFarlane", "Steven Lee", "Jason Keller"],
          :number =>    [100, 80,05,1,21],
          :shoe =>      [13,14,17,12,12],
          :points =>    [12,11,16,26,19],
          :rebounds =>  [12,12,12,12,12],
          :assists =>   [18, 12,10,6, 2],
          :steals =>    [0, 3,7, 3, 2],
          :blocks =>    [11, 10,9, 8,3],
          :slam_dunks =>[3, 5,2, 1, 0]
        }

        def player_stats(player_name)
  stat_hash = {}
  i = 0
  while i < game_hash[:home][:players][:name].length
    if player_name == game_hash[:home][:players][:name][i]
      stat_hash = {
        :number => game_hash[:home][:players][:number][i],
        :shoe => game_hash[:home][:players][:shoe][i],
        :points => game_hash[:home][:players][:points][i],
        :rebounds => game_hash[:home][:players][:rebounds][i],
        :assists => game_hash[:home][:players][:assists][i],
        :steals => game_hash[:home][:players][:steals][i],
        :blocks => game_hash[:home][:players][:blocks][i],
        :slam_dunks => game_hash[:home][:players][:slam_dunks][i]
      }
    elsif player_name == game_hash[:away][:players][:name][i]
      stat_hash = {
        :number => game_hash[:away][:players][:number][i],
        :shoe => game_hash[:away][:players][:shoe][i],
        :points => game_hash[:away][:players][:points][i],
        :rebounds => game_hash[:away][:players][:rebounds][i],
        :assists => game_hash[:away][:players][:assists][i],
        :steals => game_hash[:away][:players][:steals][i],
        :blocks => game_hash[:away][:players][:blocks][i],
        :slam_dunks => game_hash[:away][:players][:slam_dunks][i]
      }
    end
    i += 1
  end
  stat_hash
end
