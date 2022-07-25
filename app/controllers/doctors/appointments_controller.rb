module Doctors
  class AppointmentsController < ApplicationController
    before_action :set_doctor, except: :index

    def index
      @appointments = Appointment.all.where(doctor_id: current_doctor.id).reverse
    end

    def new
      @appointment = Appointment.new
    end

    def create
      @appointment = Appointment.new(appointment_params)
      if Appointment.where(doctor_id: @appointment.doctor_id, closed: false).count >= 10
        redirect_to doctors_doctors_path, notice: "This doctor has already 10 opened appointments!"
        return
      end

      if @appointment.save
        AppointmentJob.perform_later(@appointment)
        redirect_to doctors_doctor_appointment_path(@doctor, @appointment)
      else
        render 'new'
      end
    end

    def show
      @appointment = Appointment.find_by(id: params[:id])
    end

    private

    def appointment_params
      params.require(:appointment).permit(:user_id, :doctor_id, :comment, :date)
    end

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id]) if params[:doctor_id]
    end
  end
end