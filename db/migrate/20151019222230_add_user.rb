class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
