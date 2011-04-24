class Level < ActiveRecord::Base

  has_many :sentences
  has_many :vocabs

  def is_vocab?
    self.is_vocab
  end

end
