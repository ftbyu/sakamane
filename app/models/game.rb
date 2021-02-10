class Game < ApplicationRecord

  belongs_to :manager, optional: true
  belongs_to :location, optional: true
  belongs_to :type, optional: true
  has_many :achivements

end
