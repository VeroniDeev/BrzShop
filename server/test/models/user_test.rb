require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = User.new(
      name: "Test",
      surname: "Test",
      phone: "+33799999999",
      mail: "test@gmail.com",
      country: "France",
      adresse: "33 rue de la France",
      postal: "91000",
      password: "France91000"
    )

    @user2 = User.new(
      name: "Test",
      surname: "Test",
      phone: "",
      mail: "",
      country: "France",
      adresse: "33 rue de la France",
      postal: "91000",
      password: "France91000"
    )
  end
  test "User should have a name" do
    @user1.name = nil
    assert_not @user1.save, "Save user without a name"
  end
  test "User should have a surname" do
    @user1.surname = nil
    assert_not @user1.save, "Save user without a surname"
  end
  test "User should have a phone number" do
    @user1.phone = nil
    assert_not @user1.save, "Save user without a phone number"
  end
  test "User should have a mail" do
    @user1.mail = nil
    assert_not @user1.save, "Save user without a mail"
  end
  test "User should have a country" do
    @user1.country = nil
    assert_not @user1.save, "Save user without a country"
  end
  test "User should have a adresse" do
    @user1.adresse = nil
    assert_not @user1.save, "Save user without a adresse"
  end
  test "User should have a postal" do
    @user1.postal = nil
    assert_not @user1.save, "Save user without a postal"
  end
  test "User should have a password" do
    @user1.password = nil
    assert_not @user1.save, "Save user without a password"
  end
  test "User with same mail" do
    @user2.mail = @user1.mail
    @user2.phone = "+3386202782"
    @user1.save
    assert_not @user2.save, "Save user with the same mail to user1"
  end
  test "User with same phone number" do
    @user2.phone = @user1.phone
    @user2.mail = "testation@gmail.com"
    @user1.save
    assert_not @user2.save, "Save user with the same mail to user1"
  end
  test "Test password in database" do
    password = "Test12345"
    @user1.password = password
    @user1.save
    assert_not @user1.password_digest == password, "Test password in database"
  end
end
