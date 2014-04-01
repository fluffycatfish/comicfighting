class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@characters = Character.all
  	@tournaments = Tournament.all
  	@battles = Battle.all
  end

  def about
  end

  def admin

  end
end
