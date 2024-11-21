class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :location
      t.string :category
      t.references :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
