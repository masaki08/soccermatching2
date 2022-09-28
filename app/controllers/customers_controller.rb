class CustomersController < ApplicationController
   before_action :authenticate_customer!, only: [:show]

  def show
    #byebug
    @customer = Customer.find(params[:id])
    #byebug
  end
end
