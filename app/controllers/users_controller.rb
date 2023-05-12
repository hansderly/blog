class UsersController < ApplicationController
  def index
    @users = User.all
    puts @users
  end

  def show; end
end
