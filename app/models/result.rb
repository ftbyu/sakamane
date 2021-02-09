class Result < ApplicationRecord

  belongs_to :achivement, optional: true
  belongs_to :analiysis, optional: true

end
