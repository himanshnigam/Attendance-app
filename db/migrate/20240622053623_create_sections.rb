class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :student_name
      t.string :student_no
      t.integer :number
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
