class ProductsController < ApplicationController
  before_action :move_to_signed_in
  def show
    @book = Book.find(params[:id])
    @cart = current_cart
  end

  def index
    @books=Book.all
  end

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
