class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, optional: true

  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
end
