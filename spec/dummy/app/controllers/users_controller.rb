class UsersController < LoldesignPublisher::PublisherController
  
  def new
    @user = User.new
  end

end
