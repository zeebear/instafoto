class PicsController < ApplicationController

  def index

  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic
    else
      render 'create'
    end
  end

  private

  def pic_params
    params.require(:pic).require(:title, :description)
  end
end
