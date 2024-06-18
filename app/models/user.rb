class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_secure_password

    validates_uniqueness_of :email
    validates_presence_of :email, :password
end
