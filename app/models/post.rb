class Post < ActiveRecord::Base
  attr_accessible :content, :title, :picture

  validates :title, :presence => true
  validates :content, :presence => true

  default_scope order: 'posts.created_at DESC'

  # paperclip attachment
  has_attached_file :picture, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
  }
end
