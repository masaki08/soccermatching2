class RoomsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @entries = Entry.where(room_id: params[:id])
    @message = Message.new(room_id: params[:id])
    @messages = Message.where(room_id: params[:id])

  end

  def create
    # 部屋がすでにあるか探し出す
    cc_entry = Entry.where(customer_id: current_customer.id).pluck(:room_id)
    tc_entry = Entry.where(customer_id: params[:target_customer]).pluck(:room_id)
    room_id = cc_entry & tc_entry
    #byebug

    #entrys = Entry.where(customer_id: params[:target_customer])
    #entry_exists = []
    #entrys.each do |entry|
    #  entry_exists = entry.room.entries.where(customer_id: current_customer.id)
    #end
    #entry_exists = entry.where(customer_id: current_customer.id)

    #byebug
    # 部屋にユーザーが2人以上いなければ部屋を作る
    if room_id.blank?
      room = Room.create
      Entry.create(room_id: room.id, customer_id: current_customer.id) # 自分は参加する
      Entry.create(room_id: room.id, customer_id: params[:target_customer]) # target_customerを参加させる
      redirect_to room_path(room.id)
    else
      # そもそも部屋があれば…
      redirect_to room_path(room_id[0])
    end
  end
end
