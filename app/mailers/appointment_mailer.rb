class AppointmentMailer < ApplicationMailer
  def new_appointment_email(appointment)
    @appointment = appointment
    mail(to: @appointment.user.email, subject: 'You got a new appointment!"')
  end
end
