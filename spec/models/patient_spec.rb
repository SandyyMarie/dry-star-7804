require 'rails_helper'

RSpec.describe Patient do
  it { should have_many :doctors_patients }
  it { should have_many(:doctors).through(:doctors_patients) }

    before :each do
    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
  end
  it '#adult_patients' do
    patient_roster = Patient.adult_patients
    expect(patient_roster).to eq([@patient_2, @patient_1, @patient_3])
  end
end
