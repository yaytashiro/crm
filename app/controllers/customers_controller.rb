class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    #ここでfalseになって失敗することがある
    if @customer.save
      #@customer.saveに成功したら
      redirect_to @customer #redirect_to にするとフォームの中身が消える
    else
      #falseだよ
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.save
        redirect_to @customer
    else
        render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_url
  end

  private 
    def customer_params
      params.require(:customer).permit(
        :family_name,
        :given_name,
        :email
      )
    end
end
