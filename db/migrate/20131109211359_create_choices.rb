class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :content
      t.integer :poll_id

      t.timestamps
    end
  end
end
