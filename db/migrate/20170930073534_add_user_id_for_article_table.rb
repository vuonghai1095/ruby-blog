class AddUserIdForArticleTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :user, forenign_key: true
  end
end
