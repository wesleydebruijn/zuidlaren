class SoundsController < ApplicationController

  def index
    @sounds = Sound.all
  end

  def edit
    @sound = Sound.find(params[:id])
  end

  def create
    @sound = Sound.new(sound_params)
    if @sound.save
      redirect_to edit_sound_path(@sound), notice: 'Sound is created.'
    else
      render :new
    end
  end

  def update
    @sound = Sound.find(params[:id])
    if @sound.update(sound_params)
      redirect_to edit_sound_path(@sound), notice: 'Sound is updated.'
    else
      render :edit
    end
  end

  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy
    redirect_to edit_sound_path(@sound), notice: 'Sound is deleted.'
  end

  private

  def sound_params
    params.require(:sound).permit(
        :name,
        :action,
        :sound_id,
        team_ids: [],
        repository_ids: []
    )
  end




end
