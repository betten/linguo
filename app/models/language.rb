class Language < ActiveRecord::Base
  has_many :games
  has_many :levels

  scope :enabled, where("enabled = ?", true)

  def enabled?
    self.enabled
  end

  def update_level_numbers
    self.levels.sort.each_with_index do |level, index|
      level.number = index + 1
      level.save
    end
  end

end
