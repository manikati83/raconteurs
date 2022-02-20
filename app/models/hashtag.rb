class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 50 }
  has_many :topic_hashtag_relations, dependent: :destroy
  has_many :topics, through: :topic_hashtag_relations
end
