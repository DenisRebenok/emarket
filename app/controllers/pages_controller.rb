class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
    redirect_to books_path if current_user
  end

  def dashboard
    @books = current_user.books
  end
end
