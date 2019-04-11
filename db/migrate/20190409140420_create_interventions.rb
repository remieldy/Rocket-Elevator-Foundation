class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :customer, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :battery, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :column, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :elevator, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :user, foreing_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.date :interventionStart, null: true
      t.date :intervention_finish, null: true
      t.string :results, null: true
      t.text :report, optional: true
      t.text :statut,  null: true
      

    end
  end
end
