class FittingMailer < ActionMailer::Base
  default from: 'noreply@topaza-pella.ru'

  def new_fitting_mail(options)
    @fitting = options
    emails = 'lvl0nax@gmail.com,kolibri@topaza-pella.ru,utkin_@hotmail.com'
    # emails = "9856544@gmail.com,akvapolus@restsguide.ru,lider-aqva@metropost.ru"
    mail to: emails, subject: 'Запись на примерку'
  end

end
