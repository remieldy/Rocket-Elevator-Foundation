class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author_id, null: false
      t.references :customer, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :battery, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :column, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :elevator, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.integer :employee_id, null: false
      t.date :intervention_start, null: true
      t.date :intervention_finish, null: true
      t.string :results, null: default:, "Incompleted", null: false
      t.text :report, optional: true
      t.string :status, null: default: "Pending", null: false

      

    end
  end
end
