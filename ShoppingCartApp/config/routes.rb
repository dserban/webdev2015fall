Rails.application.routes.draw do
  get '/cart' => 'shopping#cart'

  post '/addnewproduct'         => 'shopping#addnewproduct'
  post '/addtoshoppingcart/:id' => 'shopping#addtoshoppingcart'
  post '/resetshoppingcart'     => 'shopping#resetshoppingcart'
end

