Rails.application.routes.draw do
  mount Gemini::Engine => "/gemini"

  get '/header_box_test', to: 'test#header_box_test'
end
