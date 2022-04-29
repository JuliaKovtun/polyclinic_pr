module Doctors
  class RecommendationsController < ApplicationController
    before_action :set_appointment

    def new
      @recommendation = Recommendation.new
    end

    def create
      @recommendation = Recommendation.new(recommendation_params)
      unless Recommendation.find_by(appointment_id: @recommendation.appointment_id).nil?
        redirect_to doctors_doctor_appointments_path(current_doctor.id), notice: "This appointment has recommendation!"
        return
      end
      if @recommendation.save
        Appointment.find_by(id: @recommendation.appointment_id).update(closed: true)
        redirect_to doctors_doctor_appointment_recommendation_path(current_doctor, @appointment, @recommendation)
      else
        render "new"
      end
    end

    def show
      @recommendation = Recommendation.find(params[:id])
    end

    private

    def recommendation_params
      params.require(:recommendation).permit(:recommendation, :appointment_id)
    end

    def set_appointment
      @appointment = Appointment.find(params[:appointment_id]) if params[:appointment_id]
    end
  end
end
