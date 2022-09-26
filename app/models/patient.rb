class Patient < ApplicationRecord
  has_many :doctors_patients
  has_many :doctors, through: :doctors_patients

  def self.adult_patients
    select('patients.*').where(age: patient.age >= 18).order(desc)
  end
end
