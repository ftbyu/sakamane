class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|

      t.string :name, comment: '場所名'
      t.boolean :is_validity, default: true, null: false, comment: '有効フラグ'

      t.timestamps
    end
  end
end
