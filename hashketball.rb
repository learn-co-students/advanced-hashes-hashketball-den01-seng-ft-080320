require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  data = game_hash
  
  data.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |k, v|
          if k[:player_name] == player_name
            return k[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |k, v|
          if k[:player_name] == player_name
            return k[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :team_name && value2 == team
        value.each do |k, v|
          if k == :colors
            return v
          end
        end
      end
    end
  end
end

def team_names
  teams = []
  
  game_hash.each do |key, value|
    value.each do |k, v|
      if k == :team_name
        teams << v
      end
    end
  end
  return teams
end

def player_numbers(team_name)
  jersey_num = []
  
  game_hash.each do |key, value|
    value.each do |k, v|
      if v == team_name
        value.each do |key2, val|
          if key2 == :players
            val.each do |players_stats, data|
              players_stats.each do |k2, val2|
                if k2 == :number
                  jersey_num << val2
                end
              end
            end
          end
        end
      end
    end
  end
  return jersey_num
end

def player_stats(name)
  
  game_hash.each do |key, value|
    value.each do |k, v|
      if k == :players
        v.each do |key2, val|
          key2.each do |k2, v2|
            if k2 == :player_name && v2 == name
              return key2
            end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |k, v|
          k.each do |k2, v2|
            if k2 == :shoe
              if v2 >= shoe_size
                shoe_size = v2
                if v2 == shoe_size
                  k.each do |k3, v3|
                    if k3 == :rebounds
                      rebounds = v3
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return rebounds
end




