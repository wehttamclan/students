require 'rails_helper'

describe Student, type: :model do
  describe "validations" do
    context "valid attributes" do
      it { should validate_presence_of(:name) }
    end
  end

  describe "relationships" do
    it { should have_many(:addresses) }
    it { should have_many(:courses).through(:student_courses) }
  end

end
