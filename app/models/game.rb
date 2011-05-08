class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :level

  before_create :set_current_level_if_none

  def current_level
    set_current_level_if_none
    self.level
  end

  protected

  def set_current_level_if_none
    if self.level.blank? and self.language.present? and self.language.levels.any?
      self.level = self.language.levels.first
      self.save
    end
  end

end
