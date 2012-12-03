class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.float :river_level, null: false
      t.text :description
      t.string :message

      t.timestamps
    end
  end
end
