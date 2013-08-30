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
  has_many :comments, through: :posts
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message'

  validates_uniqueness_of :email
  validates_presence_of :name
  
end
