class Comment < ActiveRecord::Base
  belongs_to :post

  validates :commenter, :presence => true
  validates :body, :presence => true

  #default_scope order: 'comments.created_at DESC'
end
