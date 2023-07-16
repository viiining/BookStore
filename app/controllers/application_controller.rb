class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :no_found

  private
  def no_found
    render file: Rails.root.join("public", "404.html"), status: 404, layout: false
  end
end
