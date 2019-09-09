class CreateCodeforcesGym < ActiveRecord::Migration[5.2]
  def change
    create_table :codeforces_gym, id: false do |t|
      t.string :code, null: false
      t.string :name
      t.string :url
      t.string :start_time
      t.string :end_time
      t.string :duration
      t.integer :difficulty
      t.string :in_24_hours
      t.string :status

      # t.timestamps
    end

    add_index :codeforces_gym, :code, unique: true
  end
end
