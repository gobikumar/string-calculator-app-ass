Rails.application.routes.draw do
 root 'string_add_calculator#add'
  post '/calculate', to: 'string_add_calculator#calculate'
end
