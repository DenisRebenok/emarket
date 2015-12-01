class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  
  def home
    redirect_to books_path if current_user
    @books = Book.last(4)
  end

  def dashboard
    @books = current_user.books
    @purchased = Sale.where(buyer_email: current_user.email)
    @sales = Sale.where(seller_email: current_user.email)
  end
end
