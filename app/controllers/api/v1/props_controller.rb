module Api::V1
  class PropsController < Api::PropsController
    skip_filter :authenticate_user!
    skip_before_filter :verify_authenticity_token, only: :create
    before_filter :require_user, only: :create
    check_token_on :index, :total, :create
    expose(:users_repository) { UsersRepository.new }

    private

    def current_user
      users_repository.find_by_email(params[:propser_email]) || GuestUser.new
    end

    def require_user
      render json: 'Missing propser email', status: :unprocessable_entity unless current_user.present?
    end
  end
end
