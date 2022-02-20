class Topic < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 999 }
  has_many :topic_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :topic_hashtag_relations
  
  after_create do
    topic = Topic.find_by(id: id)
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      topic.hashtags << tag
    end
  end
  
  before_update do
    topic = Topic.find_by(id: id)
    topic.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      topic.hashtags << tag
    end
  end
end
