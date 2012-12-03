class AlertMailer < ActionMailer::Base
  default from: "app9705145@heroku.com"

  def send_alert(message)
    @message = message
    a = App.all[0]
    if a
    	mail(to: a.email, subject: "River Warn - Warning!")
	else
		mail(to: AppConfig['email'], subject: "River Warn - Warning!")
	end
  end
end
