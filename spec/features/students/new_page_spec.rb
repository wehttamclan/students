require 'rails_helper'

describe "User visits students/new page" do
  scenario "fills in a form to create new student" do
    visit students_path

    click_link "Create Student"

    expect(current_path).to eq("/students/new")

    homer = "Homer Simpson"
    fill_in "student[name]", with: homer

    click_button "Submit"

    expect(current_path).to eq(student_path(Student.last))

    expect(page).to have_content(homer)
    expect(page).to_not have_content("Bart Simpson")
  end
end
