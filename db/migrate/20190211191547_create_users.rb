class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null:false, default: ""
      t.string :title, null:false, default: ""
      t.string :email,null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :encrypted_password, null: true, default: ""
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end
  end
end
