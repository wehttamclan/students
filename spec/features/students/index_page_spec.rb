require 'rails_helper'

describe "User sees all students" do
  before :each do
    @student_1 = Student.create(name: "Bart Simpson")
    @student_2 = Student.create(name: "Lisa Simpson")
  end
  scenario "a user sees a student" do
    visit students_path

    expect(current_path).to eq("/students")
    within ".students" do
      expect(page).to have_content("#{@student_1.name}")
      expect(page).to have_content("#{@student_2.name}")
    end
  end
end
