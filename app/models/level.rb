class Level < ActiveRecord::Base

  belongs_to :language

  has_many :sentences
  has_many :vocabs

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
