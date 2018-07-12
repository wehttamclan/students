require 'rails_helper'

describe "User visits /students/:id/addresses/new page" do
  scenario "fills in a form to create new student address" do
    @student_1 = Student.create(name: "Bart Simpson", id: 1)
    visit new_student_address_path(@student_1)

    expect(current_path).to eq(new_student_address_path(@student_1))


    description = 'home address'
    street = '123 blackstreet'
    city = 'Austin'
    state = 'CO'
    zip = 80098

    fill_in "address[description]", with: description
    fill_in "address[street]", with: street
    fill_in "address[city]", with: city
    fill_in "address[state]", with: state
    fill_in "address[zip]", with: zip

    click_button "Submit"

    expect(current_path).to eq(student_path(@student_1))
  end
end
