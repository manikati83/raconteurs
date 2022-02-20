class ChangeTopicGoodAddDefault < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :good
    add_column :topics, :good, :integer, default: 0
  end
end
