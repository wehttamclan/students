require 'rails_helper'

describe Student do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        student = Student.new()
        expect(student).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        student = Student.new(name: "Dropbox")
        expect(student).to be_valid
      end
    end
  end

  describe "relationships" do
  end

  describe 'class methods' do
  end
end
