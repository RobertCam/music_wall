class User < ActiveRecord::Base
  has_many :tracks
  has_many :upvotes
  

  validates :email, presence: true, format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}\z/, message: 'email must be valid'}

  def upvote_exists?(track)
    upvote = Upvotes.find_by(user_id: @current_user.id)
    if upvote.track_id == track.id 
    end
  end

end