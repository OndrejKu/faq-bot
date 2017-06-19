class Hashtag < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :company
  has_many :faq_hashtags
  has_many :faqs, through: :faq_hashtags

  has_many :link_hashtags
  has_many :links, through: :link_hashtags
end