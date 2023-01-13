class UserBuilder

  attr_accessor :user, :user_data

  def self.build(user_data)
    builder = new(user_data)
    yield(builder)
    builder.user
  end

  def initialize(user_data)
    @user = User.new
    @user_data = user_data
  end

  def set_full_name
    user.first_name = fetch_user_data_for('first_name')
    user.last_name = fetch_user_data_for('last_name')
  end

  def set_birthday
    user.birthday = Time.new(fetch_user_data_for('birthday', Time.now.to_s))
  end

  def set_gender
    user.gender = fetch_user_data_for('gender')
  end

  def set_roles
    user.roles = fetch_user_data_for('roles', [])
  end

  def set_status
    user.status = fetch_user_data_for('status', 'inactive')
  end

  def set_auth_credentials
    user.email = fetch_user_data_for('email')
    user.password = fetch_user_data_for('password')
  end

  def user; @user end

  private

  def fetch_user_data_for(value, default = nil)
    user_data[value.to_sym] || default
  rescue
    default
  end

end