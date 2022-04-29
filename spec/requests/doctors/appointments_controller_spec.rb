require "rails_helper"

RSpec.describe Doctors::AppointmentsController, type: :request do
  let(:user) { create(:user) }
  let(:doctor) { create(:doctor) }
  before { sign_in(user) }

  describe "#create" do      
    let(:params) do
      { 
        appointment: {
          user_id: user.id, 
          doctor_id: doctor.id, 
          comment: comment, 
          date: Time.now + 1.week
        }
      }
    end

    subject { post "/doctors/doctors/#{doctor.id}/appointments", params: params }
    
    context "valid params" do
      let(:comment) { "Headache!!!!!!!!" }

      it "should create appointment and redirect" do
        subject
        expect(response).to redirect_to doctors_doctor_appointment_path(doctor, Appointment.last)
      end
    end
  
    context "invalid params" do      
      let(:comment) { "Headache" }
        
      it "should not create and " do
        subject
        count = Appointment.count
        expect(Appointment.count).to eq(count)
      end

      it "render 'new' form" do
        subject
        post "/doctors/doctors/#{doctor.id}/appointments", params: params
        expect(response).to render_template 'new'
      end
    end
  end
end