class Comment < ActiveRecord::Base
  attr_accessible :commenter, :body
  belongs_to :post

  validates :commenter, :presence => true
  validates :body, :presence => true
  validates :post_id, :presence => true
end
