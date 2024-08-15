class AddStudentNumberToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :student_number, :integer
    add_index :sections, :student_number
  end
end
