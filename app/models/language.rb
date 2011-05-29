class Language < ActiveRecord::Base
  has_many :games
  has_many :levels

  def update_level_numbers
    self.levels.sort.each_with_index do |level, index|
      level.number = index + 1
      level.save
    end
  end

end
