class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@characters = Character.all
  end

  def about
  end
end
