class PicsController < ApplicationController
  before_action :find_pic, only: %i[show edit update destroy]

  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Yessss! It was posted!"
    else
      render 'new'
    end
  end

  def show

  end

  private

  def find_pic
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).require(:title, :description)
  end
end
