class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
  end
end
