class TodosController < ApplicationController

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to edit_team_path(@todo.team), notice: 'Todo is created.'
    else
      render :new
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to edit_team_path(@todo.team), notice: 'Todo is updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to edit_team_path(@todo.team), notice: 'Todo is deleted.'
  end

  private

  def todo_params
    params.require(:todo).permit(
        :title,
        :team_id,
        :user_id,
        :completed
    )
  end

end
