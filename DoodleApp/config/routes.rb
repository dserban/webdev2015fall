Rails.application.routes.draw do
  get '/doodle'                                      => 'poll#doodle'
  get '/showeditformforchoicesmadebyparticipant/:id' => 'poll#showeditform_p'
  get '/showeditformforoption/:id'                   => 'poll#showeditform_o'

  post '/addnewoption'                           => 'poll#addnewoption'
  post '/savenewchoices'                         => 'poll#savenewchoices'
  post '/saveeditedchoicesmadebyparticipant/:id' => 'poll#saveeditedchoices'
  post '/saveeditedoption/:id'                   => 'poll#saveeditedoption'
  post '/resetpolloptions'                       => 'poll#resetpolloptions'
  post '/deleteparticipant/:id'                  => 'poll#deleteparticipant'
end

