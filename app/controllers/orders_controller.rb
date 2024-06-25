class OrdersController < ApplicationController
  def new
    @order = Order.new
    @books = @current_cart.books
    soldout_books = @current_cart.books.where(status: :soldout)
    if soldout_books.exists?
      flash[:alert] = "#{soldout_books.count}冊の商品が売り切れです。カートに追加できません。"
      redirect_to products_path
    end
  end

  def confirm
    counts = order_params[:count]
    @order = Order.new(order_params)
    @books = Book.where(id: order_params[:book_ids])
    @line_items = @current_cart.line_items
    counts.each_with_index do |count, index|
      book_id = order_params[:book_ids][index]
      line_item = @line_items.find_by(book_id: book_id)
      if line_item.present?
        line_item.update(quantity: count)
      end
    end
  end


  def create
    count = order_params[:count].map(&:to_i).sum
    @order = Order.new(address: order_params[:address], count: count)
    @books = Book.where(id: order_params[:book_ids])
    if @order.save
      @books.each do |book|
            book.soldout! 
    end
      OrderDetail.create_items(@order, @current_cart.line_items)
        redirect_to complete_order_path(@order)
    else
      redirect_to new_order_path, alert: '注文の登録ができませんでした'  
    end
  end
  
  def complete  
    @order = Order.find(params[:id])
    CompleteMailer.complete_mail(current_user,@order).deliver_now


  end


  private
  def order_params
    params.require(:order).permit(:address, count: [], book_ids: [])
  end
end