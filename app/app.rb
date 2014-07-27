module RadioNation
  require 'json'
  require 'dm-serializer'
  require 'haml'

  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions


    get "/radios" do
      radios = City.all
      return radios.to_json(:methods => [:radios])
    end


    get :show do
       @radios = Radio.all
       render 'radios/show'
    end

    def getTimezonesString(radio)
      timezonesString = ""
      radio.timezones.each do |item|
        if timezonesString == ""
          timezonesString = item.timezone
        else
          timezonesString = timezonesString + "," + item.timezone
        end
      end
      puts timezonesString
      return timezonesString
    end
  end
end
