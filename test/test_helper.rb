ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include ActionDispatch::TestProcess
  include FactoryBot::Syntax::Methods

  def project_admin
    @project_admin ||= create(:project_admin)
  end

  def developer
    @developer ||= create(:developer)
  end


  # Add more helper methods to be used by all tests here...
end
