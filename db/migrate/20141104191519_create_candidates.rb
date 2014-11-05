class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :party_affil
      t.string :district
      t.string :seat

      t.timestamps
    end
  end
end
