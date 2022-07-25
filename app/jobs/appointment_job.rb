class AppointmentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    AppointmentMailer.new_appointment_email(args[0]).deliver
  end
end
