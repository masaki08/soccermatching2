class CustomersController < ApplicationController
   before_action :authenticate_customer!, only: [:show]

  def show
    @customer = Customer.find(params[:id])
  end
end
