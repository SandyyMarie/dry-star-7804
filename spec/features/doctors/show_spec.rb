require 'rails_helper'

RSpec.describe 'As a visitor, when I visit the Doctors show page' do
  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
  end

  it "shows all the given doctors information including: name/specialy/university (US1)" do
    visit doctor_path(@doctor_1)
    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.name)
  end

  it "shows the given doctors' place of work and all the patients they have (US1)"

end