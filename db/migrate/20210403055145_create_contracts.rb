class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.belongs_to :team
      t.belongs_to :player

      t.timestamps
    end
  end
end
