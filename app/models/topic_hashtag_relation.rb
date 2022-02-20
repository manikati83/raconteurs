class TopicHashtagRelation < ApplicationRecord
  belongs_to :topic
  belongs_to :hashtag
  validates :topic_id, presence: true
  validates :hashtag_id, presence: true
end
