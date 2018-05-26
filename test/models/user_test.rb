require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "validates admin" do
    assert project_admin.admin?
  end

  test "validates developer" do
    assert_not developer.admin?
  end
end
