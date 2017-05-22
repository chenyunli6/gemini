class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper Gemini::ApplicationHelper
  helper Gemini::HeaderBox
end
