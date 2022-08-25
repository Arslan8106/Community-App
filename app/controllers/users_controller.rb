class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @users = User.page(params[:page]).per(6).order(id: :desc)
  end
  def show
    @user = User.find_by_id(params[:id])
  end
end
