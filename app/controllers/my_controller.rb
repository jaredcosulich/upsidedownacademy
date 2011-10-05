class MyController < ApplicationController
  before_filter :authenticate_user!

  def lessons
  end

end
