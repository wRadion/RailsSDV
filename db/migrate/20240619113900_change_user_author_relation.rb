class ChangeUserAuthorRelation < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :author, null: true, foreign_key: true

    User.find_each do |user|
      user.author_id = user.author.id
      user.save!
    end

    remove_reference :authors, :user, foreign_key: true
    change_column_null :users, :author_id, false
  end
end
