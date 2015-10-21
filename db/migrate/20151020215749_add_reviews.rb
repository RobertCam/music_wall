class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.references :user
      t.references :track
      t.timestamp :created_at
      t.timestamp :updated_at
    end

    change_table :tracks do |t|
      t.integer :upvotes, default: 0
    end
  end
end
