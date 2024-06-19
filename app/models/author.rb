class Author < ApplicationRecord
    has_and_belongs_to_many :books
    has_one :user
end
