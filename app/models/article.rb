class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :author, :foreign_key => "authors_id"


  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
