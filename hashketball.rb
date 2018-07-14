require 'pry'

def game_hash
hashketball = {
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
        :steals =>3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
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
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
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
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored (name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            stats.each do |int, value|
              if int == :points
                return value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size (name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            stats.each do |int, value|
              if int == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors (team)
  game_hash.each do |location, team_data| #first level 
    team_data.each do |attribute, data| #second level
      if data == team
        return team_data[:colors]
      end
    end
  end
end

def team_names
name_array = []
game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        name_array.push(data)
      end
    end
  end
  name_array
end

def player_numbers (team)
  team_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team
        team_data[:players].each do |player, stats|
          stats.each do |list, value|
            if list == :number
              team_numbers.push(value)
            end
          end
        end
      end
    end
  end
team_numbers
end

def player_stats (name)
new_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == name
            stats.each do |int, value|
              new_hash[int]=value
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
new_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |int, value|
            if int == :shoe
              new_array.push(value)
            end
          end
        end
      end
    end
  end

new_array

big_shoe = new_array.max
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |int, value|
            if int == :shoe
              if value == big_shoe
                return stats[:rebounds]
              end
            end
          end
        end
      end
    end
  end
end
