class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :track
  has_many :upvotes
end