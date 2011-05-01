class Sentence < ActiveRecord::Base
  belongs_to :level

  validates_presence_of :english, :foreign
end
