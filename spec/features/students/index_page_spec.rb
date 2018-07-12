require 'rails_helper'

describe "User sees all students" do
  before :each do
    @student_1 = Student.create(name: "Bart Simpson", id: 1)
    @student_2 = Student.create(name: "Lisa Simpson", id: 2)
  end
  scenario "a user sees a student" do
    visit students_path

    expect(current_path).to eq(students_path)
    within ".students" do
      expect(page).to have_content("#{@student_1.name}")
      expect(page).to have_content("#{@student_2.name}")
    end
  end
  scenario "a teacher destroys a student" do
    visit students_path

    expect(current_path).to eq(students_path)

    within "##{@student_1.id}" do
      click_link "Delete"
    end

    expect(page).to_not have_content("#{@student_1.name}")
    expect(page).to have_content("#{@student_2.name}")
  end
end
