class CatsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_owner, only: %i(edit update)
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    flash[:current_cat_id] = @cat.id
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.owner = current_user
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.find(params[:id])
    render :edit
  end

  def update
    @cat = current_user.cats.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end

  def ensure_owner
    @cat = current_user.cats.find_by(id: params[:id])
    unless @cat
      flash[:errors] = ["You do not have permission to modify this cat!"]
      redirect_to cats_url
    end
  end
end
