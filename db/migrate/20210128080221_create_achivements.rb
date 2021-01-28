class CreateAchivements < ActiveRecord::Migration[6.0]
  def change
    create_table :achivements do |t|

      t.integer :player_id, comment: '外部キー　選手'
      t.integer :game_id, comment: '外部キー　試合'
      t.string :comment, comment: 'コメント'

      t.timestamps
    end
  end
end
