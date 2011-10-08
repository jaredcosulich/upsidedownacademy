class ProfilesController < ApplicationController

  def show
    @user = User.with_lessons.find_by_id(Integer.unobfuscate(params[:id]))
  end

end
