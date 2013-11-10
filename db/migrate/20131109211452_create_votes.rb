class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :choice_id
      t.string :identifier

      t.timestamps
    end
  end
end
