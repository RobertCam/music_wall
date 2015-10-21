class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :track
  belongs_to :review
end