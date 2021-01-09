class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.page(params[:page]).per(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by(id: params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.power = 1
    if @user.save
      flash.now[:success] = "创建用户成功"
      redirect_to '/'
    else
      if @user.user_name == ""
        flash.now[:name] = "用户名非空"
        render :action=>'new'
      elsif User.find_by(user_name:@user.user_name)
        flash.now[:rename] = "用户名已存在"
        render :action=>'new'
      elsif @user.user_name.length < 2
        flash.now[:short] = "用户名太短"
        render :action=>'new'
      elsif @user.user_name.length > 50
        flash.now[:long] = "用户名太长"
        render :action=>'new' 
      elsif @user.password == nil
        flash.now[:password] = "请输入密码"
        render :action=>'new' 
      elsif @user.password.length < 6
        flash.now[:password1] = "输入密码长度过短"
        render :action=>'new' 
      elsif @user.password_confirmation != @user.password
        flash.now[:diff] = "请两次输入相同的密码"
        render :action=>'new' 
      elsif User.find_by(email:@user.email)
        flash.now[:reemail] = "此邮箱已经注册过账号，请重新输入"
        render :action=>'new' 
      elsif !(@user.email =~ /(.)*@mails.ucas.ac.cn/)
        flash.now[:email] = "邮箱请以@mails.ucas.ac.cn结尾"
        render :action=>'new'
      else
        flash.now[:gener] = "请选择性别"
        render  :action=>'new'
      end 
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #@user = User.find_by(email: params[:email])
    if current_user.power == 2 && current_user == @user
      respond_to do |format|
        format.html { redirect_to users_url, notice: '非法删除操作' }
        format.json { head :no_content }
      end
    elsif current_user.power == 1
      @user.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: '注销成功' }
        format.json { head :no_content }
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: '删除用户成功' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_name, :password, :email, :power, :gender_id, :password_confirmation)
    end
end
