class ProfilesController < ApplicationController

  def show
    @user = User.find_by_id(Integer.unobfuscate(params[:id]))
  end

end
