class User
  attr_accessor :first_name,
                :last_name,
                :gender,
                :date_of_birth,
                :status

  def initialize(attributes = {})
    set_attributes(self, attributes)
  end

  def clone_and_set(attributes = {})
    copied = self.clone
    set_attributes(copied, attributes)
    copied
  end

  # This method can have a better name that doesn't have `set_`
  def set_attributes(obj, attributes)
    attributes.each do |key, value|
      obj.public_send("#{key}=", value)
    end
  end
end

USER_DATA = {
  first_name: 'marvin',
  last_name: 'kang',
  gender: 'male',
  status: 'active',
  date_of_birth: '2000-01-02',
}

original = User.new(USER_DATA)
puts " "*10
puts "Original object"
puts original.inspect

copied = original.clone_and_set({first_name: 'ann', gender: 'female'})
puts " "*10
puts "Prototype of the original with changes"
puts copied.inspect

puts " "*10
puts "Direct clone of the original"
cp = original.clone
puts cp.inspect

# puts original.equal?(copied)
# puts original.equal?(cp)
