class OrdersController < ApplicationController
  def new
    @order = Order.new
    @book = Book.find(params[:book_id])
  end

  def confirm
    @order = Order.new(order_params)
    @book = Book.find(order_params[:book_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @book = Book.find(order_params[:book_id]) 
      @book.soldout! 
      redirect_to complete_orders_path(book_id: @book.id, order_id: @order.id)
    else
      render "confirm"
    end
  end

  def complete  
    book = Book.find(params[:book_id])
    order = Order.find(params[:order_id])
    CompleteMailer.complete_mail(current_user,book,order).deliver_now
  end

  private
  def order_params
    params.require(:order).permit(:count, :address, :book_id)
  end
  
end
