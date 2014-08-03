module RadioNation
  require 'json'
  require 'dm-serializer'
  require 'haml'

  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    use Rack::Auth::Basic, "Need Authentication to proceed" do |username, password|
      username == 'foo' && password == 'bar'
    end

    get "/radios" do
      logger.info params[:uuid]
      logger.info params[:email]
      user = User.first_or_create({:uuid => params[:uuid]},{
        :uuid => params[:uuid],
        :email => params[:email],
        :source => params[:source]
      })
      user.save
      radios = City.all
      json = radios.to_json(:methods => [:radios])
      logger.info json
      return json
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
      logger.info timezonesString
      return timezonesString
    end
  end
end
