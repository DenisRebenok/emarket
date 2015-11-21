class PagesController < ApplicationController
  def home
    redirect_to books_path if current_user
  end
end
