Rails.application.routes.draw do
  get '/mainpage' => 'start_the_dark#mainpage'

  post '/signinas/:id'       => 'start_the_dark#signin'
  post '/signout'            => 'start_the_dark#signout'
  post '/chooseactivity/:id' => 'start_the_dark#chooseactivity'
  post '/addactivity'        => 'start_the_dark#addactivity'
end

