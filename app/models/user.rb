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
  @called_omniauth = false
  has_secure_password unless @omniauth_user == true

  attr_accessible :email, :password, :password_confirmation, :uid, :provider, :remember_token, :name, :description, :facebook_link, :linkedin_link, :twitter_link

  has_many :posts
  has_many :comments, through: :posts
  has_many :messages
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message'

  validates_uniqueness_of :email
  validates_presence_of :name
  before_save :create_remember_token

  def self.create_with_omniauth(auth)
  create! do |user|
    user.email = auth["info"]["email"]
    user.name = auth["info"]["name"]
    user.password_digest = SecureRandom.urlsafe_base64
    user.password = auth["credentials"]["token"]
    user.password_confirmation = auth["credentials"]["token"]
    user.provider = auth["provider"]
    user.uid = auth["uid"]
  end
end

  #  def self.from_omniauth(auth)
  #   @called_omniauth = true
  #   where(auth["extra"]["raw_info"].slice(:email, :name)).first_or_create 
  # end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
