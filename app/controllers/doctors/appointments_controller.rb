module Doctors
  class AppointmentsController < ApplicationController
  before_action :set_doctor

    def new
      @appointment = Appointment.new
    end

    def create
      @appointment = Appointment.new(params[:appointment].permit!)
      if @appointment.save!
        redirect_to doctors_doctor_appointment_path(@doctor, @appointment)
      else
        render "new"
      end
    end

    def show
      @appointment = Appointment.find_by(params[:id])
    end


    def set_doctor
      @doctor = Doctor.find(params[:doctor_id]) if params[:doctor_id]
    end
  end
end