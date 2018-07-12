require 'rails_helper'

describe 'user visits courses/:id' do
  before :each do
    @course_1 = Course.create(name: 'big course', id: 1)
    @course_2 = Course.create(name: 'little course', id: 2)
    @student_1 = @course_1.students.create(name: "Bart Simpson")
    @student_2 = @course_1.students.create(name: "Lisa Simpson")
    @student_3 = @course_2.students.create(name: 'Homer Simpson')
  end
  scenario 'user sees list of student names' do
    visit course_path(@course_1)

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_2.name)

    visit course_path(@course_2)

    expect(page).to have_content(@student_3.name)
  end
end
