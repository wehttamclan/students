class StudentsController < ApplicationController
  def index
    @students = Student.all.includes(:addresses)
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def show
    @student = Student.includes(:addresses).find(params[:id])
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to students_path
  end

  private
    def student_params
      params.require(:student).permit(:name)
    end
end
