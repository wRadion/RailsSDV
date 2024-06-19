class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :author

    has_many :books, through: :author

    has_secure_password

    validates_uniqueness_of :email
    validates_presence_of :email
    validates_presence_of :password, on: :create
end
