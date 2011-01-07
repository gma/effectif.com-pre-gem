module Nesta
  class App
    use Rack::Static, :urls => ['/slate'], :root => 'themes/slate/public'

    get '/css/:sheet.css' do
      content_type 'text/css', :charset => 'utf-8'
      cache sass(params[:sheet].to_sym)
    end

    get '/' do
      set_common_variables
      set_from_config(:title, :subtitle, :description, :keywords)
      @heading = @title
      @title = "#{@title} - #{@subtitle}"
      @articles = Page.find_articles[0..7]
      @body_class = 'home'
      cache haml(:index)
    end
  end
end
