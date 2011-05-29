class Level < ActiveRecord::Base

  belongs_to :language

  has_many :sentences
  has_many :vocabs

  after_create do
    self.language.update_level_numbers
  end

  after_destroy do
    self.language.update_level_numbers
  end

  def is_vocab?
    self.is_vocab
  end

  def vocab
    self.vocabs
  end

  include Comparable   
  def <=> other
    return 0 if !self.number && !other.number
    return 1 if !self.number
    return -1 if !other.number
    self.number <=> other.number
  end
  
end
