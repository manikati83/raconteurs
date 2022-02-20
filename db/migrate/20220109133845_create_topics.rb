class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content
      t.integer :good

      t.timestamps
    end
  end
end
