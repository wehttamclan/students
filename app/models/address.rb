class Address < ApplicationRecord
  validates_presence_of :description, :street, :city, :state, :zip
end
