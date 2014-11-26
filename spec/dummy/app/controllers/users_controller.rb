class UsersController < ApplicationController
  layout 'loldesign_publisher/publisher'
  
  def new
    @user = User.new
  end

end
