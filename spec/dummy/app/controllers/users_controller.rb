class UsersController < LoldesignPublisher::PublisherBootstrapController
  before_action :set_user, except: [:new, :create, :index]

  def index
    @users = User.order(created_at: :desc).page(params[:page] || 1).per_page(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to users_path, notice: "Usuário criado com sucesso!"
    else
      render :new, alert: "Não foi possível criar o Usuário!"
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(users_params)
      redirect_to edit_user_path(@user), notice: "Usuário atualizado com sucesso!"
    else
      render :edit, alert: "Não foi possível editar o Usuário!"
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "Usuário removido com sucesso!"
    else
      redirect_to users_path, alert: "Não foi possível remover o Usuário"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :description, :active)
  end
end
