class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :salary
      t.integer :record, array: true, default: [0,0,0]
      t.belongs_to :user

      t.timestamps
    end
  end
end
