class Game < ApplicationRecord

  belongs_to :manager, optional: true
  has_many :achivements

end
