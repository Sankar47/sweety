class CreateGlucoseLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :glucose_levels do |t|
      t.integer :level
      t.integer :user_id

      t.timestamps
    end
  end
end
