class PicsController < ApplicationController
  before_action :find_pic, only: %i[show edit update destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Yessss! It was posted!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Congrats! Pic was updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @pic.delete
    redirect_to pic_path
  end

  private

  def find_pic
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description, :photo)
  end
end
