require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "create new project with valid params" do
    assert create(:project)
  end

  test "unable to create new project when name is null" do
    assert_not build(:project, name: nil).valid?
  end

  test "able to create new project when description is null" do
    assert build(:project, description: nil).valid?
  end
end
