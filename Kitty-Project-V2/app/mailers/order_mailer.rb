class OrderMailer < ApplicationMailer
  require 'open-uri'
  
  default from: 'zekittenproject@gmail.com'
  
  def welcome_order(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = order.user

    # on récupère l'instance order pour ensuite pouvoir la passer à la view en @order
    @order = order

    @filenames = []
    order.items.each_with_index { |item, index|
      if item.image.attached?
        @filenames << item.title + item.image.filename.extension_with_delimiter
        if ActiveStorage::Blob.service.respond_to?(:path_for)
          attachments.inline[@filenames[index]] = File.read(ActiveStorage::Blob.service.send(:path_for, item.image.key))
        elsif ActiveStorage::Blob.service.respond_to?(:download)
          attachments.inline[@filenames[index]] = item.image.download
        end
      end
    }

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = 'https://ze-kitten-project.herokuapp.com/' 
    
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Votre commande chez Ze Kitten Project !') 
  end
  
  def info_admin(order)
    @order = order
    @user = order.user
    @admin = 'zekittenproject@gmail.com' 
    
    @url = 'https://ze-kitten-project.herokuapp.com/' 
    mail(to: @admin, subject: 'Historique des commandes !') 
  end
end