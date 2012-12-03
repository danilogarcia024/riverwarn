class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
