module Admin::GamesHelper

  #スコア計算
  def score(game)
    achivements = Achivement.where(game_id: game)
    analiysis = Analiysis.find_by(name: "得点数")
    score = 0
    achivements.each do |achivement|
      results = Result.where(achivement_id: achivement.id, analiysis_id: analiysis.id)
      results.each do |result|
        score += result.amount
      end
    end
    "#{score}"
  end

  #総数計算
  def total(game, analiysis)
    achivements = Achivement.where(game_id: game)
    total = 0
    achivements.each do |achivement|
      results = Result.where(achivement_id: achivement.id, analiysis_id: analiysis.id)
      results.each do |result|
        total += result.amount
      end
    end
    "#{total}"
  end
end
