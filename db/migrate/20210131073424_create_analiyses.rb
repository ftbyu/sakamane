class CreateAnaliyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analiyses do |t|

      t.integer :achivements_id, comment: '外部キー　個人成績'
      t.string :name, comment: '外部キー　試合'
      t.boolean :is_validity, default: true, null: false, comment: '有効フラグ'

      t.timestamps
    end
  end
end
