class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer
  end
  def change
    add_column :users, :provider, :string
  end
end
