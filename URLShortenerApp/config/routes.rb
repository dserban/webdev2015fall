Rails.application.routes.draw do
  get '/showinputfield'          => 'shortener#showinputfield'
  get '/showresultofshortening'  => 'shortener#showresultofshortening'
  get '/showbadlongurlerrorpage' => 'shortener#showbadlongurlerrorpage'
  get '/:id'                     => 'shortener#redirectorshowbadshorturlerrorpage'

  post '/performshortening'      => 'shortener#performshortening'
end

