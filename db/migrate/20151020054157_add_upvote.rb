class AddUpvote < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :track
      t.references :user
    end
  end
end
