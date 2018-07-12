require 'rails_helper'

describe Student do
  describe "validations" do
    context "valid attributes" do
      it { should validate_presence_of(:name) }
    end
  end

  describe "relationships" do
    it { should have_many(:addresses) }
  end

  describe 'class methods' do
  end
end
