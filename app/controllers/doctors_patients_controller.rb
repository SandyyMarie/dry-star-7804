class DoctorsPatientsController < ApplicationController
  def destroy
    require 'pry'; binding.pry
    @relationship = DoctorsPatient.find(params[:])
  end
end