class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all 
  end

  def new
    @message = Message.new
    @message.recipient_id = recipient_id(params[:id])
  end

  def create
    @message = Message.new(params[:id])
    @message.sender = current_user
    @message.save
    redirect_to messages_path
  end  

  def show
    @message = Message.find(params[:id])
    sender = User.find(@message.sender_id)
    @profile = sender.profile
  end

end