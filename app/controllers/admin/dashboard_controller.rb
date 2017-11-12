class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => "user", :password => "password"
  before_filter :authorize
  def show
  end
end
