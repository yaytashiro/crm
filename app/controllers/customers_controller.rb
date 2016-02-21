class CustomersController < ApplicationController
#アクションの前に実行したいものを記述する
#after_actionもある
#set_customerを：実装する
before_action :set_customer, only: [:show, :edit, :update, :destroy]
before_action :set_company, only: [:new, :edit]
#deviseが持ってるアクション
before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    # @customers = Customer.all
    # #gemを使いたい
    # @customers = Customer.page(params[:page])
    @customers = Customer.page(params[:page])
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
  end

  def update
    if @customer.save
        redirect_to @customer
    else
        render :edit
    end
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private 
    def customer_params
      params.require(:customer).permit(
        :family_name,
        :given_name,
        :email,
        :company_id
      )
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
    
    def set_company
      @companies = Company.all
    end

end
