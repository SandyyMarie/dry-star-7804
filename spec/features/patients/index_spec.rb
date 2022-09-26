require 'rails_helper'

RSpec.describe 'As a visitor, when I visit the Patients index page' do
  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)

    @doctor_2 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @patient_3 = @doctor_2.patients.create!(name: "Rebecca Pope", age: 32)

    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor_3 = @hospital_2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @patient_4 = @doctor_3.patients.create!(name: "Zola Shepherd", age: 2)
  end

# User Story 3, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all adult patients (age is greater than 18),
# And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)

it 'shows the name of all adult patients (18+) and I see their names in ascending alphabetical order (A-Z)' do
  visit patients_path

  expect(page).to have_content(@patient_2.name)
  expect(page).to have_content(@patient_1.name)
  expect(page).to have_content(@patient_3.name)
  expect(page).to_not have_content(@patient_4.name)  
end