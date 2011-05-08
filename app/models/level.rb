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

end
