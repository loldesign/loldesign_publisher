class LoldesignPublisher::ActivablesController < LoldesignPublisher::PublisherController
  respond_to :html, :json

  before_filter :load_resource

  def create
    if @resource.update_attribute(:active, true)
      render json: {message: "#{@resource.class.to_s} - #{@resource.id} activated."}
    else
      head :error
    end
  end

  def destroy
    if @resource.update_attribute(:active, false)
      render json: {message: "#{@resource.class.to_s} - #{@resource.id} inactivated."}
    else
      head :error
    end
  end

  private
  def load_resource
    @resource = params[:resource_name].classify.constantize.find params[:id]
  end
end