class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.text :description
      t.string :facebook_link
      t.string :linkedin_link
      t.string :twitter_link
      t.timestamps
    end
  end
end
