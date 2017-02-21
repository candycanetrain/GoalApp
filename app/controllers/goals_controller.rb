class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      # render :new
      redirect_to new_goal_url
    end
  end

  def new
    @goal = Goal.new
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.user_id = current_user.id
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :completed, :privacy)
  end
end
