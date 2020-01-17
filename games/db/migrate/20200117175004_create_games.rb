class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :Comment

      t.timestamps null: false
    end
  end
end
