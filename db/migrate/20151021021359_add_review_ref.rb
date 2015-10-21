class AddReviewRef < ActiveRecord::Migration
  def change
    change_table :upvotes do |t|
      t.references :review
    end
  end
end
