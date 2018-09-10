class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def authenticate_admin!
    unless current_user.admin
      redirect_to '/'
     end
  end

  
end
