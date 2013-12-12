class RevenuesMailer < ActionMailer::Base
  default to: Proc.new { User.pluck(:email) },
          from: 'notification@example.com'
 
  def revenues_email(revenue)
    @revenue = revenue
    mail(subject: "Nova receita cadastrada: #{@revenue.name}")
  end
end
