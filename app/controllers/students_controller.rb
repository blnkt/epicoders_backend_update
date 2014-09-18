class StudentsController < ApplicationController
  respond_to :html, :json
  def index
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      respond_to do |format|
        format.json { render :json => @student }
      end
    else
      respond_with({error: "Incomplete"})
    end
  end

private
  def student_params
    params.require(:student).permit(:name, :season, :year, :github_username)
  end
end
