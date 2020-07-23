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

def num_points_scored(player)
  points_scored = nil
  game_hash.each do |key, value|
        value[:players].each do |person|
          if person[:player_name] == player
            points_scored = person[:points]
          end
      end
  end
  points_scored
end

def shoe_size(player)
  shoe = nil
  game_hash.each do |key, value|
        value[:players].each do |person|
          if person[:player_name] == player
            shoe = person[:shoe]
          end
      end
  end
  shoe
end

def team_colors(team_name)
  colors = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      colors = value[:colors]
    end
  end
  colors
end

def team_names
  final_teams = []
  game_hash.each do |key, value|
    value.each do |teams|
      if teams[0] == :team_name
        final_teams.push(teams[1])
      end
    end
  end
  final_teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, value|
    if team_name == value[:team_name]
      value[:players].each do |player_stats|
        numbers.push(player_stats[:number])
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |key, value|
    value[:players].each do |stats|
      if stats[:player_name] == player_name
        return stats
      end
    end
  end
end

def find_largest_shoe
  largest_shoe_size = 0
  game_hash.each do |key, value|
    value[:players].each do |stats|
      if stats[:shoe] > largest_shoe_size
        largest_shoe_size = stats[:shoe]
      end
    end
  end
  largest_shoe_size
end

def big_shoe_rebounds
  largest_shoe = find_largest_shoe
  game_hash.each do |key, value|
    value[:players].each do |stats|
      if stats[:shoe] == largest_shoe
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  most_points = 0 
  game_hash.each do |key, value|
    value[:players].each do |stats|
      if stats[:points] > most_points
        most_points = stats[:points]
      end
    end
  end
  most_points
end










