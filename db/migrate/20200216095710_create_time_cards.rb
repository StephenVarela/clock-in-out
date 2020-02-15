class CreateTimeCards < ActiveRecord::Migration[6.0]
  def change
    create_table :time_cards do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.bigint :total_time
      t.belongs_to :user

      t.timestamps
    end
  end
end
