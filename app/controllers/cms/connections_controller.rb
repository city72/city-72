class Cms::ConnectionsController < BackOfficeController

  before_filter :set_connection

  def show
  end

  def update
    @connection.attributes = params[:connection]
    @connection.save
    render status: :ok, nothing: true
  end

  private
  def set_connection
    @connection = Connection.first
  end

end