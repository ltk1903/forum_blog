class Users::SessionsController < Devise::SessionsController
  # GET /signin
  def new
    super
  end

  # POST /signin
  def create
    super
  end

  # DELETE /logout
  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    articles_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
