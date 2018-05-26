require 'test_helper'

class TodoTest < ActiveSupport::TestCase

  test "create new todo with valid params" do
    assert create(:todo)
  end

  test "unable to create new todo when name is null" do
    assert_not build(:todo, name: nil).valid?
  end

  test "able to create new todo when description is null" do
    assert build(:todo, description: nil).valid?
  end

  test "has a valid project assigned to it" do
    todo = create(:todo)
    assert todo.project
  end

  test "has a valid user assigned to it" do
    todo = create(:todo)
    assert todo.user
  end

  test "can be reassigned to new user" do
    todo = create(:todo)
    new_developer = create(:developer)
    todo.update(user: new_developer)
    assert_equal todo.user, new_developer
  end

  test "modify the status of todo" do
    todo = create(:todo)
    todo.update(status: STATUS[:in_progress])
    assert_equal todo.status, STATUS[:in_progress]
  end

  test "can add user to the project list if project list doesn't has one" do
    project = create(:project)
    developer = create(:user)
    new_developer = create(:user)
    todo = create(:todo, user_id: developer.id, project: project)
    todo.update(user: new_developer)
    assert_includes todo.project.users, new_developer
  end
end
