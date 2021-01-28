class Player < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :manager, optional: true
  has_many :achivements

end
