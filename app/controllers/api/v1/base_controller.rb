class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { error: "record not found" }, status: :not_found
  end

  private

  def authenticate
    authenticate_with_token || unauthorized
  end

  def authenticate_with_token
    authenticate_with_http_token do |token|
      @user ||= User.find_by(api_key: token)
    end
  end

  def unauthorized
    head :unauthorized
  end

  def serialize(records)
    records.as_json(except: [:created_at, :updated_at, :user_id],
                 include: {tags: {except: [:created_at, :updated_at, :user_id]}})
  end
end