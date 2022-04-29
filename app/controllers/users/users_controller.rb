module Users
  class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :user_appointments, :show_appointment]
    before_action :user, only: [:show, :user_appointments, :show_appointment]

    def index
    end

    def show   
    end

    def user_appointments
      @appointments = Appointment.where(user_id: current_user.id).reverse
    end

    def show_appointment
      @appointment = Appointment.find_by(id: params[:appointment_id])
      @recommendation = Recommendation.find_by(appointment_id: @appointment.id)
      @doctor = Doctor.find_by(id: @appointment.doctor_id)
    end

    private

    def user
      @user = current_user
    end
  end
end