# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # Ghi đè các hành động của Devise nếu cần

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

  # Ghi đè phương thức này để chuyển hướng sau khi đăng nhập thành công
  def after_sign_in_path_for(resource)
    root_path
  end

  # Ghi đè phương thức này để chuyển hướng sau khi đăng xuất
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
