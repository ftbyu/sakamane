class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|

      t.integer :achivement_id, comment: '外部キー　個人成績'
      t.integer :analiysis_id, comment: '外部キー　分析内容'
      t.integer :amount, comment: '記録数'

      t.timestamps
    end
  end
end
