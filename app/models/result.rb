class Result < ApplicationRecord

  belongs_to :achivement, optional: true
  belongs_to :analiysis, optional: true

  def self.multi_update(results_params)
    results_params.to_h.map do |id, result_param|
      result = self.find(id)
      result.update_attributes!(result_param)
    end
  end

end
