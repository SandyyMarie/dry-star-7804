class DoctorsPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    relationship = DoctorsPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    relationship.destroy

    redirect_to doctor_path(doctor)
  end
end