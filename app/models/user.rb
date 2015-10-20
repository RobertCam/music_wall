class User < ActiveRecord::Base
  has_many :tracks
  has_many :upvotes
  has_many :upvoted_tracks, through: :tracks, source: :track


  validates :email, presence: true, format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}\z/, message: 'email must be valid'}
end