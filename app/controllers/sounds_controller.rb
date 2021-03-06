class SoundsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :play

  def index
    @sounds = Sound.all
  end

  def edit
    @sound = Sound.find(params[:id])
  end

  def new
    @sound = Sound.new
  end

  def start
    ENV['PLAY'] = 'true'
  end

  def stop
    ENV['PLAY'] = 'false'
  end

  def play
    sound = Sound.where(slug: params[:slug]).first
    if sound && ENV['PLAY'] == 'true'
      PlaySoundJob.perform_later(sound.sound_file_name, sound.sound.url, sound.slug)
    end

    render nothing: true, status: 204
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
    redirect_to sounds_path, notice: 'Sound is deleted.'
  end

  private

  def sound_params
    params.require(:sound).permit(
        :name,
        :slug,
        :sound,
    )
  end




end
