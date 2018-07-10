require 'rails_helper'

describe "User sees one student" do
  before :each do
    @student_1 = Student.create(name: "Bart Simpson")
    @student_2 = Student.create(name: "Lisa Simpson")
  end
  scenario "a user sees a student" do
    visit student_path(@student_1)

    expect(current_path).to eq("/students/#{@student_1.id}")
    expect(page).to have_content("Student: #{@student_1.name}")
  end
end
