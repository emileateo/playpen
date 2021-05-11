class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :status
      t.string :message
      t.datetime :when
      t.string :venue

      t.timestamps
    end
  end
end
