require 'rails_helper'

describe "User visits student show page" do
  before :each do
    @student_1 = Student.create(name: "Bart Simpson", id: 1)
    @student_2 = Student.create(name: "Lisa Simpson", id: 2)
    @address_1 = @student_1.addresses.create(description: "home address", street: '123 big street', city: 'austin', state: 'CO', zip: 12332)
    @address_2 = @student_1.addresses.create(description: "away address", street: '234 little street', city: 'denver', state: 'NY', zip: 12222)
    @address_3 = @student_2.addresses.create(description: 'winter address', street: '235 blvd', city: 'new york', state: 'MB', zip: 22222)
  end
  scenario "sees student's name" do
    visit student_path(@student_1)

    expect(current_path).to eq(student_path(@student_1))
    expect(page).to have_content("Student: #{@student_1.name}")
  end
  scenario "sees list of addresses" do
    visit student_path(@student_1)

    expect(current_path).to eq(student_path(@student_1))

    expect(page).to have_content(@address_1.description)
    expect(page).to have_content(@address_1.street)
    expect(page).to have_content(@address_1.city)
    expect(page).to have_content(@address_1.state)
    expect(page).to have_content(@address_1.zip)
    expect(page).to have_content(@address_2.description)
    expect(page).to have_content(@address_2.street)
    expect(page).to have_content(@address_2.city)
    expect(page).to have_content(@address_2.state)
    expect(page).to have_content(@address_2.zip)
  end
end
