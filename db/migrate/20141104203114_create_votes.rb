class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer   :value,  default: 1
      t.timestamps
    end
  end
end
