class RoomsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @entries = Entry.where(room_id: params[:id])
    @message = Message.new(room_id: params[:id])
    @messages = Message.where(room_id: params[:id])
  end

  def create
    # 部屋がすでにあるか探し出す
    room_exists = Entry.where(customer_id: [current_customer.id, params[:target_customer]])

    # 部屋にユーザーが2人以上いなければ部屋を作る
    if room_exists.count < 2
      room = Room.create
      Entry.create(room_id: room.id, customer_id: current_customer.id) # 自分は参加する
      Entry.create(room_id: room.id, customer_id: params[:target_customer]) # target_customerを参加させる
      redirect_to room_path(room.id)
    else
      # そもそも部屋があれば…
      redirect_to room_path(room_exists.first.room_id)
    end
  end
end
