class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post

    mail to: "teni0abe@gmail.com", subject: "投稿確認メール"
  end
end
