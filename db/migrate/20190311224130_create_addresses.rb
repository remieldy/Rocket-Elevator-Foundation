<<<<<<< HEAD
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type, null: false
      t.string :status
      t.string :entity
      t.string :number_street, null: false
      t.string :apt_number
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.text :notes
    end
  end
end
=======
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type, null: false
      t.string :status
      t.string :entity, null: false
      t.string :number_street, null: false
      t.string :apt_number
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.text :notes
    end
  end
end
>>>>>>> 4fb2435f1b6ce87e06de761d11f5d3429465ebe4
