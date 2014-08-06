class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def show
  end

  def index
    @users = @users.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user.member_since = Date.today
    @user.member_until = Date.today + 1.year
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def create
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  protected

  def user_params
    params[:user].permit(:email, :password,
                         :name, :last_name, :gender,
                         :birthdate, :birthplace,
                         :address, :city, :zip_code,
                         :tax_code, :member_since, :member_until)
  end
end
