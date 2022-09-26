class Patient < ApplicationRecord
  has_many :doctors_patients
  has_many :doctors, through: :doctors_patients

  def self.adult_patients
    select('patients.*').where('age >= 18').order(:name)
  end
end
