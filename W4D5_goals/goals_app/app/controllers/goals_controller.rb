class GoalsController < ApplicationController
  before_action :ensure_logged_in

  def index
    user = User.find_by(id: params[:id])
    @goals = user.goals
    render :index # index page will also include a new form
  end

  def show

  end

  # new will come from index
  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
