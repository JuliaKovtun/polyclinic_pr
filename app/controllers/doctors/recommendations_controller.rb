module Doctors
  class RecommendationsController < ApplicationController
    before_action :set_appointment

    def new
      @recommendation = Recommendation.new
    end

    def create
      @recommendation = Recommendation.new(recommendation_params)
      if @recommendation.save
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
