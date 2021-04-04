class CreateLeaderboards < ActiveRecord::Migration[6.1]
  def change
    create_table :leaderboards do |t|
      t.string :placements, array: true, default: []

      t.timestamps
    end
  end
end
