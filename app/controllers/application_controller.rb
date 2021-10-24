class ApplicationController < ActionController::Base
  include CurrentUser
  include AuthenticateUser
end
