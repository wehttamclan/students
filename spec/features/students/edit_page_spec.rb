require 'rails_helper'

describe "User edits student's name" do
  before :each do
    @student_1 = Student.create(name: "Bart Simpson")
    @student_2 = Student.create(name: "Lisa Simpson")
  end
  describe "User visits students/:id/edit page" do
    scenario "fills in a name to edit student.name" do
      visit students_path

      click_link "#{@student_1.name}"

      expect(current_path).to eq(edit_student_path(@student_1))

      fill_in :student_name, with: "Maggie Simpson"

      click_on "Submit"

      expect(current_path).to eq(student_path(@student_1))
      expect(page).to have_content("Student: Maggie Simpson")
      expect(page).to_not have_content("Student: #{@student_1.name}")
    end
  end
end
