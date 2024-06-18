class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { where(parent_id: nil) }, dependent: :destroy

  scope :of, ->(user) { user.is_a?(Integer) ? where(user_id: user) : where(user: user) }
  scope :recent, -> { where(created_at: 2.week.ago..DateTime.now) }

  def to_s
    "#{self.titre} - #{self.content}"
  end
end
