module Doctors
  class DoctorsController < ApplicationController
    def index
      @doctors = Doctor.all.by_category(params[:category_id]) 
      @categories = Category.all
    end
  end
end