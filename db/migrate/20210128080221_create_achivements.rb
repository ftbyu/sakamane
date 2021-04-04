class CreateAchivements < ActiveRecord::Migration[6.0]
  def change
    create_table :achivements do |t|

      t.integer :player_id, comment: '外部キー　選手'
      t.integer :game_id, comment: '外部キー　試合'
      t.string :player_comment, comment: '選手コメント'
      t.string :manager_comment, comment: 'マネージャーコメント'

      t.timestamps
    end
  end
end
