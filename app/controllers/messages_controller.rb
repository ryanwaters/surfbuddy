class MessagesController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user, except: [:new, :create]

  def index
    @user = User.find(params[:user_id])
    @messages = @user.received_messages
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @message = Message.new(params[:message])
    @message.sender = current_user
    @message.recipient_id = params[:user_id]
    @message.save
    redirect_to user_messages_path
  end  

  def show
    @message = Message.find(params[:id])
    sender = User.find(@message.sender_id)
    @profile = sender.profile
  end

end