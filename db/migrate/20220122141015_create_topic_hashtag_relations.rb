class CreateTopicHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_hashtag_relations do |t|
      t.references :topic, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
