class Section < ApplicationRecord
    belongs_to :student, foreign_key: :student_number, primary_key: :id
    has_one_attached :student_photo
    has_many_attached :student_subjects
  end
  