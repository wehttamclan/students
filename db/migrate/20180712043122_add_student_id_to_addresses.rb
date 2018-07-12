class AddStudentIdToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :student, index: true, foreign_key: true
  end
end
