# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base

  belongs_to :posts
  belongs_to :user
  
  attr_accessible :user_id, :post_id, :body
end
