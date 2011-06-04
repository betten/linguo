class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :level

  def current_level
    set_current_level_if_none
    self.level
  end

  def current_level?
    self.level.present?
  end

  def has_next_level?
    n = self.level.number.to_i + 1
    self.language.levels.where(:number => n).present?
  end

  def goto_next_level
    return false unless self.has_next_level?
    n = self.level.number.to_i + 1
    self.level = self.language.levels.where(:number => n).first
    self.save
  end

  def total_levels
    self.language.levels.count
  end

  def name
    self.language.name
  end

  def levels
    self.language.levels
  end

  protected

  def set_current_level_if_none
    if self.level.blank? and self.language.present? and self.levels.any?
      self.level = self.levels.first
      self.save
    end
  end

end
