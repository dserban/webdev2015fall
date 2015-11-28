Rails.application.routes.draw do
  get '/following' => 'following#mainpage'

  post '/signinas/:id'     => 'following#signin'
  post '/signout'          => 'following#signout'
  post '/togglefollow/:id' => 'following#togglefollow'
end

