# Write your code below game_hash
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
  game_hash.each do |team, attributes|
    attributes[:players].each do |stats|
      if stats[:player_name] == player_name
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, attributes|
    attributes[:players].each do |stats|
      if stats[:player_name] == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(home_or_away_team)
  game_hash.each do |team, attributes|
    if attributes[:team_name] == home_or_away_team
     return attributes[:colors]
    end
  end
end

def team_names()
  teams = []
  game_hash.each do |team, attributes|
    teams << attributes[:team_name]
  end
  teams  
end

def player_numbers(team)
  jersey_nums = []
  game_hash.each do |teams, attributes|
    if attributes[:team_name] == team
      attributes[:players].each do |stats|
        jersey_nums << stats[:number]
      end
    end
  end
  jersey_nums
end


def player_stats(player)
  game_hash.each do |team, attributes|
    counter = 0
    attributes[:players].each do |stats|
      if stats[:player_name] == player 
        return attributes[:players][counter]
      end
      counter += 1
    end
  end
end

def big_shoe_rebounds()
  bigfoot_rebounds = 0
  bigfoot = 0 
  game_hash.each do |team, attributes|
    attributes[:players].each do |stats|
      if stats[:shoe] > bigfoot
        bigfoot = stats[:shoe]
        bigfoot_rebounds = stats[:rebounds]
      end
    end
  end
  bigfoot_rebounds  
end 

def most_points_scored()
  high_scorer = ""
  most_points = 0 
  game_hash.each do |team, attributes|
    attributes[:players].each do |stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        high_scorer = stats[:player_name]
      end
    end
  end
  high_scorer
end 

def winning_team()
  teams = team_names()
  home_points = [0, teams[0]] 
  away_points = [0, teams[1]]
  game_hash[:home][:players].each do |stats|
    home_points[0] += stats[:points]
  end 
  game_hash[:away][:players].each do |stats|
    away_points[0] += stats[:points]
  end
  if home_points[0] > away_points[0]
    return home_points[1]
  else
    return away_points[1]
  end
end

def player_with_longest_name()
  longest_name = ""
  game_hash.each do |team, attributes|
    attributes[:players].each do |stats|
      name = stats[:player_name].split("")
      if name.length > longest_name.length
        longest_name = name
      end
    end
  end
  return longest_name.join("")
end 

def most_steals()
  most_steals = 0 
  player_with_most_steals = ""
  game_hash.each do |team, attributes|
    attributes[:players].each do |stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        player_with_most_steals = stats[:player_name]
      end
    end
  end
  player_with_most_steals
end 

def long_name_steals_a_ton?()
  if most_steals() == player_with_longest_name()
    return true
  end
end

# Write code here