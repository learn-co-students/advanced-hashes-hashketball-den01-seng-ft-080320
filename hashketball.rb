require "pry"
require "pp"

# Write your code below game_hash
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
  points_scored = 0
  
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  
  home_players.each do |index|
    index.each do |attribute,value|
      if value == player
        points_scored = index[:points]      
      end
    end
  end
  
  away_players.each do |index|
    index.each do |attribute,value|
      if value == player
        points_scored = index[:points]
      end  
    end  
  end
  points_scored
end  

def shoe_size(player)
  shoe_size = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_players.each do |index|
    index.each do |attribute,value|
      if value == player
        shoe_size = index[:shoe]
      end
    end
  end
  away_players.each do |index|
    index.each do |attribute,value|
      if value == player
        shoe_size = index[:shoe]
      end  
    end  
  end
  shoe_size
end  

def team_colors(team)
  team_colors = []
  game_hash.each do |status, team_attributes|
    team_attributes.each do |attribute, value|
      if value == team
        team_colors.concat(game_hash[status][:colors])
      end  
    end
  end 
  team_colors
end  

def team_names
  teams = []
  teams << game_hash[:home][:team_name] 
  teams << game_hash[:away][:team_name]
end

# def player_numbers(team)
#   numbers = []
#   if game_hash[:home][:team_name] == team
#     game_hash[:home][:players].each do |attribute, value|
#       attribute.each do |key, value|
#         if key == :number
#           numbers << attribute[key]
#         end  
#       end
#     end
#   elsif game_hash[:away][:team_name] == team
#     game_hash[:away][:players].each do |attribute, value|
#       attribute.each do |key, value|
#         if key == :number
#           numbers << attribute[key]
#         end  
#       end
#     end
#   end  
#   numbers
# end  

def player_numbers(team)
  roster = []
  game_hash.each do |location,team_hash|
    if team_hash[:team_name] == team
      team_hash[:players].each do |player|
        roster << player[:number]
      end
    end
  end
  roster
end          
def player_stats(name)
  stats = {}
  game_hash.each do |team, team_attributes|
    team_attributes[:players].each do |player|  
          
          if name == player[:player_name]
            stats.merge!(player)
          end      
    end
  end
  stats
end  
def big_shoe_rebounds
  biggest_shoe = 0 
  bs_rebounds = 0 
  game_hash.each do |team, team_attributes|
    team_attributes[:players].each do |player|          
          if player[:shoe] > biggest_shoe
            biggest_shoe = player[:shoe]
            bs_rebounds = player[:rebounds]
          end     
    end  
  end
  bs_rebounds
end  