class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.float :length
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
