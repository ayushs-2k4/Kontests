class CreateCodeforces < ActiveRecord::Migration[5.2]
  def change
    create_table :codeforces, id: false do |t|
      t.integer :code, null: false
      t.string :name
      t.string :start_time
      t.string :end_time
      t.string :duration
      t.string :in_24_hours
      t.string :status

      # t.timestamps
    end

    add_index :codeforces, :code, unique: true
  end
end
