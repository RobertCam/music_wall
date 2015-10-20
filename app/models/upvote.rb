class Upvote < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  validates :track_id, uniqueness: true, scope: :user_id

  
end