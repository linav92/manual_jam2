class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @stories = Story.all
  end
end
