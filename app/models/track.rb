class Track < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes
  

  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true

end

