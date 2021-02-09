class Achivement < ApplicationRecord

  belongs_to :player, optional: true
  belongs_to :game, optional: true
  has_many :results

end
