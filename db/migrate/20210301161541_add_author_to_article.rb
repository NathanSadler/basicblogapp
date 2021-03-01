class AddAuthorToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :authors, index: true, foreign_key: true
  end
end
