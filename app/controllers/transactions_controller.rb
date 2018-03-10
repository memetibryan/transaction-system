class TransactionsController < ApplicationController
	before_action :authenticate_user!
	
	def index
    end

    def show
      @u = User.find(params[:id])
      @transactions = Transaction.where(:user_id === @u)
    end

    def new
      @user = current_user
      @transaction = @user.transactions.new
    end

    def create
      @user = current_user
    @transaction = @user.transactions.new(transaction_params)
    if @transaction.save
      redirect_to transaction_path(@user)
    else
      render :new
    end
    end

    def edit
      @transaction = Transaction.find(params[:id])
    end

    def update
      @transaction= Transaction.find(params[:id])
      if @transaction.update(transaction_params)
        redirect_to transactions_path
      else
        render :new
      end
    end

    def destroy
      @transaction = Transaction.find(params[:id])
      @transaction.destroy
      redirect_to transactions_path
    end

  private
    def transaction_params
      params.require(:transaction).permit(:sender, :recepient, :amount)
    end
end
