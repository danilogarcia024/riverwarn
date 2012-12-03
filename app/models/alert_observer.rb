class AlertObserver < ActiveRecord::Observer
  def after_create(alert)
    AlertMailer.send_alert(alert.message).deliver
  end
end