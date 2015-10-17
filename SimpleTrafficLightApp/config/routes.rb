Rails.application.routes.draw do
  get '/showtrafficlight' => 'traffic_light#showtrafficlight'

  post '/changecolorto/:newcolor' => 'traffic_light#changecolor'
end
