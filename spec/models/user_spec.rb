require 'spec_helper'

describe User do
  # it { should validate_uniqueness_of :email}
  it { should validate_presence_of :name}
  it { should have_many :posts}
  it { should have_many :comments}
  it { should have_many :sent_messages}
  it { should have_many :received_messages}
  
end