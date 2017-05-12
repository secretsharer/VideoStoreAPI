class CustomersController < ApplicationController

  def index
    customers = Customer.all
    render json: customers.as_json(only: [:id, :name, :registered_at, :postal_code, :phone])
    #movies_checked_out_count
  end

  def show
    customer = Customer.find_by(id: params[:id])
    if customer
      render json: customer.as_json(only: [:id, :name, :registered_at, :postal_code, :phone]), status: :ok
    else
      render json: { errors: "customer does not exist" }, status: :not_found
    end
  end


end
