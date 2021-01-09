class CoursesController < ApplicationController
  include CoursesHelper
  include SessionsHelper
  skip_before_action :verify_authenticity_token, :only => [:select_with_ajax1, :select_with_ajax]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if !params[:q].blank?
      @q = Course.ransack(params[:q])
      @course = @q.result.includes(:major, :teacher)
    else
      @course = Course.all
    end
    
  end

  def to_review
    if current_user.nil?
      flash[:notice] = "请先登录" 
      redirect_to course_url(params[:id])
    else
      flash[:toer] =current_user
      redirect_to course_path(params[:id])
    end
  end
  # GET /courses/1
  # GET /courses/1.json
  def show
    @comment=Comment.where(:course => @course)
    @index=0
  end

  def select_with_ajax
      @majors = College.find_by_id(params[:selected1]).majors
      render json: @majors
  end

  def select_with_ajax1
    @teachers = College.find_by_id(params[:selected2]).teachers
    render json: @teachers
  end

  def select_with_logged
    @current_user = current_user
    render json: @current_user
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def search
    index
    render :index
  end
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
      if @course.save
        redirect_to @course
      else
        if @course.name == ""
          flash.now[:name] = "名字非空"
          render :action=>'new' 
        elsif Course.find_by(name: @course.name)
          flash.now[:rename] = "名字已存在"
          render :action=>'new' 
        elsif @course.name.length < 2
          flash.now[:short] = "名字太短"
          render :action=>'new'
        elsif @course.name.length > 50
          flash.now[:long] = "名字太长"
          render :action=>'new'   
        elsif @course.major_id == nil
          flash.now[:major] = "请选择专业"
          render :action=>'new' 
        elsif @course.teacher_id == nil
          flash.now[:teacher] = "请选择老师"
          render :action=>'new' 
        end
      end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_comment
    #将客户端提交的参数保存到变量中
    content = params[:content]
    course_id = params[:course_id]
    #先判断当前是否有用户登录，没有登录需要提示登录
    if current_user.blank?
      flash.notice = "您还未登录，请先登录！"
      redirect_to "/courses/#{course_id}"
    #再判断评论内容是否为空，内容为空，提示并且返回到帖子详情页面
    elsif content.blank?
      flash.notice = "评论内容不能为空"
      redirect_to "/courses/#{course_id}"
    else
      #as_type参数为0时，说明是帖子的评论
      
        #创建评论
        boolean_0 = Comment.create(user_id: current_user.id,content: content,course_id: course_id)
        if boolean_0
          flash.notice = "评论成功"
        else
          flash.notice = "评论失败，请重新评论"
        end
        #重定向到帖子详情页面
        redirect_to "/courses/#{course_id}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :major_id, :year, :teacher_id)
    end
end
 