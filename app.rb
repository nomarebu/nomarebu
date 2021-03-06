class App < Sinatra::Base
  set :static, true
  set :public, "public"
  set :haml, {:format => :html5 }

  get '/' do
    haml :index
  end

  get '/*.css' do |path|
    content_type 'text/css'
    sass path.to_sym
  end
end
