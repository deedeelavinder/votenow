class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :name
      t.string :email
      t.string :party_affil
      t.string :location
      t.string :token

      t.timestamps
    end
  end
end
