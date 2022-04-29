require 'rails_helper'

RSpec.feature "Doctors", type: :feature do
  context "leave recommendation for patient" do
      let!(:current_doctor) { create(:doctor) }
      let!(:user1) { create(:user) }
      let!(:appointment) { create(:appointment, doctor_id: current_doctor.id, user_id: user1.id) }
      
      scenario "should be successful" do

      page.visit new_doctor_session_path
      page.fill_in "Phone", :with => "0987654391"
      page.fill_in "Password", :with => "password123"
      page.click_button "Sign in"

      expect(page).to have_content("Your appointments:")
      expect(page).to have_content("add recommendations")
      
      page.click_link "add recommendations"

      expect(page).to have_content("Add recommendation")

      page.fill_in "Recommendation", :with => "This is my recommendation for that case!"
      page.click_button "Create a recommendation"

      expect(page).to have_content("Recommendation")
      expect(current_path).to eq(doctors_doctor_appointment_recommendation_path(
        current_doctor, 
        appointment, 
        Recommendation.last))
    end 
  end
end