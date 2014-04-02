class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :internal_server_error
  rescue_from ActionController::RoutingError, with: :not_found
  rescue_from ActionController::UnknownController, with: :not_found
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: '../../public/404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def internal_server_error(exception)
    logger.info exception.backtrace.join("\n")
    respond_to do |format|
      format.html { render template: '../../public/500', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end
end
