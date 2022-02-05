class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.create!(user_params)
    if @user.save
      render json: { 'success' => 'You have successfully created user' }, status: :created
    else
      render json: { 'error' => 'Error :Post could not be saved' }, status: 'Bad'
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password
    )
  end

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    render json: { message: 'Something went wrong.' }
  end
end