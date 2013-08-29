# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  recipient_id :integer
#  sender_id    :integer
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Message < ActiveRecord::Base
  
  belongs_to :users

  attr_accessible :recipient_id, :sender_id, :body

end
