module Features
  def last_email
    ActionMailer::Base.deliveries.last || raise("No mail sent")
  end
end
