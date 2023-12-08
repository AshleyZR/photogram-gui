class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({:created_at => :desc})
    render({:template => "photo_templates/index"})
  end

  def show
    unique_photoid = params.fetch("unique_photoid")
    @the_photo = Photo.where({:id => unique_photoid}).first
    render({:template => "photo_templates/show"})
  end

  def add
    @new_photo = Photo.new
    @new_photo.owner_id = params.fetch("input_owner_id")
    @new_photo.image = params.fetch("input_image")
    @new_photo.caption = params.fetch("input_caption")
    @new_photo.save
    redirect_to("/photos/#{@new_photo.id}")
  end

  def update
    unique_photoid = params.fetch("unique_photoid")
    @the_photo = Photo.where({:id => unique_photoid}).first
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.save
    redirect_to("/photos/#{unique_photoid}")
  end

  def destroy
    unique_photoid = params.fetch("unique_photoid")
    @the_photo = Photo.find_by(id: unique_photoid)
    @the_photo.destroy
    redirect_to("/photos")
  end
end
