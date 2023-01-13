require './user_builder.rb'

USER_DATA = {
  first_name: 'marvin',
  last_name:  'kang',
  birthday:   '2000-01-01',
  gender:     'male',
  roles:      ['candidate'],
  status:     'active',
  email:      'test@user.com',
  password:   'password'
}

class User
  attr_accessor :first_name, :last_name,
                :birthday, :gender, :roles, :status,
                :email, :password

  def initialize(data = {first_name: nil, last_name: nil, birthday: nil, gender: nil, roles: [], status: nil, email: nil, password: nil})
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @birthday = Time.new(data[:birthday] ||  Time.now.to_s )
    @gender = data[:gender]
    @roles = data[:roles] || []
    @status = data[:status]
    @email = data[:email]
    @password = data[:password]
  end

end

old_user = User.new(USER_DATA)

puts " "*10
puts "Without Builder Design System"
puts old_user.inspect

new_user = UserBuilder.build(USER_DATA) do |builder|
  builder.set_full_name
  builder.set_birthday
  builder.set_gender
  builder.set_auth_credentials
  builder.set_roles
  builder.set_status
end

puts " "*10
puts "With Builder Design System"
puts new_user.inspect