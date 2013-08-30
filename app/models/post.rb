# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  attr_accessible :user_id, :body, :title
  validates_presence_of :user 
end
