module Doctors
  class DoctorsController < ApplicationController
    def index
      @doctors = Doctor.all.by_category(params[:category_id]) 
      @categories = Category.all
    end

    def show
      @doctor = Doctor.find(params[:id])
    end
  end
end