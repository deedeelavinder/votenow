class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string    :description

      t.timestamps
    end
  end
end
