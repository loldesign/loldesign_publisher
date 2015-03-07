#encoding: utf-8
module LoldesignPublisher
  class MailerConfigGenerator < ::Rails::Generators::Base
    DEFAULT_VALUES = {
      smtp:           'smtp.sendgrid.net',
      port:            587,
      user_name:      'loldesign',
      password:       'f8ks256$',
      domain:         'heroku.com',
      authentication: :plain,
      env:            :development,
      asset_host:     'http://www.loldesign.com.br/'
    }

    def create_config
      environment   = get_answer_for(value: :env       , question: "Which environment would yu like to set?", ask_options: {limited_to: ["development", "production", "test"]})
      smtp_address  = get_answer_for(value: :smtp      , question: "Whats the STMP addres? ex. smtp.sendgrid.net :")
      port_number   = get_answer_for(value: :port      , question: "What's port number? ex. 587 :")
      user_name     = get_answer_for(value: :user_name , question: "What's your user_name?")
      password      = get_answer_for(value: :password  , question: "What's your password?", ask_options: {echo: false})
      puts ' '
      domain        = get_answer_for(value: :domain    , question: "What's the domain name? ex. heroku.com :")
      asset_host    = get_answer_for(value: :asset_host, question: "Whats's the asset_host?")

      inject_into_file "config/environments/#{environment}.rb", :before => /^end/ do
        "\n  # MAILER CONFIG \n" +
        "  config.action_mailer.asset_host = '#{asset_host}' \n" +
        "  config.action_mailer.delivery_method = :smtp \n"      +
        "  config.action_mailer.smtp_settings = { \n"            +
        "  :address        => '#{smtp_address}',\n"              +
        "  :port           => '#{port_number}', \n"              +
        "  :authentication => :plain, \n"                        +
        "  :user_name      => '#{user_name}', \n"                +
        "  :password       => '#{password}', \n"                 +
        "  :domain         => '#{domain}' \n"                    +
        "  } \n"
      end
    end

    private
    def get_answer_for(options={})
      answer = ask(options[:question], options[:ask_options])

      answer.present? ? answer : DEFAULT_VALUES[options[:value]]
    end
  end
end