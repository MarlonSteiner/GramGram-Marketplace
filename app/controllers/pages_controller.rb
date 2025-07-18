# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @grannies = Granny.all.includes(:image_attachment)
  end
end
