class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|

      t.integer :manager_id, comment: '外部キー　マネージャー'
      t.integer :location_id, comment: '外部キー　場所'
      t.integer :type_id, comment: '外部キー 試合タイプ'
      t.integer :enemy_score, comment: '敵スコア'
      t.string :enemy_name, comment: '敵チーム名'
      t.string :enemy_image_id, comment: '敵画像'
      t.string :video_link, comment: '動画リンク'

      t.timestamps
    end
  end
end
