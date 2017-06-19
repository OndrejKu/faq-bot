class LinkHashtag < ActiveRecord::Base
  validates_presence_of :link_id, :hashtag_id
  
  belongs_to :link
  belongs_to :hashtag
end