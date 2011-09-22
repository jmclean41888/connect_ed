class PagesController < ApplicationController
  def home
    unless signed_in?
      redirect_to new_user_path
    end
  end

end
