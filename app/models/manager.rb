class Manager < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  generate_public_uid generator: PublicUid::Generators::NumberSecureRandom.new

  has_many :players
  has_many :games

end
