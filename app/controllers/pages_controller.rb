class PagesController < ApplicationController
  
  def index
    @galleries = Gallery.all
  end

  def photography
  end

  def portfolio
  end

  def gallery
  end

  def contact
  end
end
