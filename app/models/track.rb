class Track < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes
  has_many :upvoted_users, through: :upvotes, source: :user


  validates :title, presence: true
  validates :artist, presence: true

  def upvote
    @track = Track.find(params[:id])

    if @track.upvotes.create(user_id: current_user.id)
      flash[:notice] =  "Thank you for upvoting!"
      redirect '/tracks'
    else 
      flash[:notice] =  "You have already upvoted this!"
      redirect '/tracks'
    end
  end
end