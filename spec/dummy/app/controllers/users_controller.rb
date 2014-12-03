class UsersController < LoldesignPublisher::PublisherController

  def index
    @users = User.all  
  end

  def new
    @user = User.new
  end
end
