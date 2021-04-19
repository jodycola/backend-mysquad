class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :salary
      t.belongs_to :user

      t.timestamps
    end
  end
end
