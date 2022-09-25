class MessagesController < ApplicationController
  before_action :authenticate_customer!, only: [:create]

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to room_path(message.room_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(customer_id: current_customer.id, room_id: params[:room_id])
  end
end
