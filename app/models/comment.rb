class Comment < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :votes, as: :votable
end
