# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  name            :string(255)
#  description     :text
#  facebook_link   :string(255)
#  linkedin_link   :string(255)
#  twitter_link    :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :name, :description, :facebook_link, :linkedin_link, :twitter_link

  has_many :posts

  validates_uniqueness_of :email
  
end
