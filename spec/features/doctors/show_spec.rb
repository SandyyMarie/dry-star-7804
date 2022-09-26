require 'rails_helper'

RSpec.describe 'As a visitor, when I visit the Doctors show page' do
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

  it "shows all the given doctors information including: name/specialy/university (US1)" do
    visit doctor_path(@doctor_1)
    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)

    expect(page).to_not have_content(@doctor_2.name)
    expect(page).to_not have_content(@doctor_3.name)
  end

  it "shows the given doctors' place of work and all the patients they have (US1)" do
    visit doctor_path(@doctor_1)
    expect(page).to have_content(@doctor_1.hospital.name)
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)

    expect(page).to_not have_content(@patient_3.name)
    expect(page).to_not have_content(@patient_4.name)

    expect(page).to_not have_content(@doctor_3.hospital.name)
  end

# User Story 2, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
  it 'shows an button option next to patients name to remove from caseload' do
    visit doctor_path(@doctor_1)
    within("#patient-#{@patient_1.id}") do
      expect(page).to have_content(@patient_1.name)
      click_link 'remove from caseload'
    end

    expect(current_path).to eq(doctor_path(@doctor_1))
    expect(page).to_not have_content(@patient_1.name)
  end
end