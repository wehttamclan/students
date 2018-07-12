class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    redirect_to course_path(@course)
  end

  def show
    @course = Course.includes(:students).find(params[:id])
  end

  private
    def course_params
      params.require(:course).permit(:name)
    end
end
