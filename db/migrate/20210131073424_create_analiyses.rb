class CreateAnaliyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analiyses do |t|

      t.string :name, comment: '分析名'
      t.boolean :is_validity, default: true, null: false, comment: '有効フラグ'

      t.timestamps
    end
  end
end
