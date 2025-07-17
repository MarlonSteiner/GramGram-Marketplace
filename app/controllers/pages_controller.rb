class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

  def home
    @grannies = Granny.all
  end
end
