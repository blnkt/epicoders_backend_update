class StudentsController < ApplicationController
  # before_action :authenticate_user!, :only => :create
  skip_before_filter :verify_authenticity_token

  respond_to :html, :json
  def index
    @students = Student.order(:name)
    @student = Student.new
    respond_to do |format|
      format.html { render :json => @students }
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      respond_to do |format|
        format.json { redirect_to students_path }
      end
    else
      respond_with({error: "Incomplete"})
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = "#{@student.name} has been deleted"
      redirect_to :back
    else
      flash[:alert] = "Unable to delete #{@student.name}"
      redirect_to :back
    end
  end

  def show
    @student = Student.find(params[:id])
  end

private
  def student_params
    params.require(:student).permit(:name, :season, :year, :github_username)
  end
end
