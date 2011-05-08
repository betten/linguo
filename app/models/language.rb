class Language < ActiveRecord::Base
  has_many :games
  has_many :levels
end
