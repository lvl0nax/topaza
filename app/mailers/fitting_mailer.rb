class FittingMailer < ActionMailer::Base
  default from: 'topaza-pella'

  def new_fitting_mail(options)
    @fitting = options
    emails = 'lvl0nax@gmail.com,lvl0nax@yandex.com'
    # emails = "9856544@gmail.com,akvapolus@restsguide.ru,lider-aqva@metropost.ru"
    mail to: emails, subject: 'Примерка платья'
  end

end
