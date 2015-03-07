module LoldesignPublisher
  class ContactMailer < ActionMailer::Base
    def send_contact_message(options={})
        @title        = options[:title]        || 'Título Padrão'
        @message      = options[:message]      || 'Mensagem Padrão' 
        @subject      = options[:subject]      || 'E-mail enviado pelo web-site.'
        @extra_fields = options[:extra_fields] || {}
        @to           = options[:to]           || 'eduardo@loldesign.com.br'
        @from         = options[:from]         || 'suporte@loldesign.com.br'

        mail( :to      => @to,
              :from    => @from,
              :subject => @subject )
      end
  end
end