require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "first stuff" do
    user = User.new(email:'as@saddas.de')
    assert !user.save
    user.password ='1234'
    assert !user.save
    user.name ="Sandal"
    assert user.save
  end

  test "email uniqueness" do
    user= User.create!(email: 'as@saddas.de',name: "Sha7ata", password:"12345")
    user2= User.new(email: 'as@saddas.de',name: "Sha7ataa", password:"123455")
    assert !user2.save
    assert user2.errors.map(&:attribute),[:emai]
   
  end

  test "fancy_comp" do
    user= User.create!(email: 'as@saddas.de',name: "Sha7ata", password:"12345")
    assert_equal user.fancy_comp(1,2), 3
    assert_not_equal user.fancy_comp(1,2), 7
    
  end
  test "raises on missing email" do
    user= User.create(name: "Sha7ata", password:"12345")
    assert_raises (ActiveRecord::RecordInvalid) { user.save! }
    
  end
  test "using fixtures" do
    user = users(:diffdoff)
    assert_equal user.name, "Christof" 
    
  end 
end
