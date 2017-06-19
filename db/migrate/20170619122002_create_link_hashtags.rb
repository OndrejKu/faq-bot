class CreateLinkHashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :link_hashtags do |t|
      t.integer :link_id
      t.integer :hashtag_id
    end
  end
end
