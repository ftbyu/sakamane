# frozen_string_literal: true

class DeviseCreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|

      t.integer :manager_id, comment: '外部キー'
      t.string :first_name, comment: '名前(姓)'
      t.string :last_name, comment: '名前(名)'
      t.string :kana_first_name, comment: '名前(カナ姓)'
      t.string :kana_last_name, comment: '名前(カナ姓)'
      t.string :image_id, comment: '画像'
      t.integer :height, comment: '身長'
      t.integer :weight, comment: '体重'
      t.integer :grade, comment: '学年 eunmで管理'
      t.boolean :is_validity, default: false, null: false, comment: '有効フラグ'

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :players, :email,                unique: true
    add_index :players, :reset_password_token, unique: true
    # add_index :players, :confirmation_token,   unique: true
    # add_index :players, :unlock_token,         unique: true
  end
end
