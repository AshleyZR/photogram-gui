class UsersController < ApplicationController
  def index
    @all_users = User.all.order({:username => :asc})
    render({ :template => "user_templates/index" })
  end

  def show
    unique_username = params.fetch("unique_username")
    @the_user = User.where({:username => unique_username}).first
    render({:template => "user_templates/show"})
  end

  def add
    @new_user = User.new
    @new_user.username = params.fetch("input_username")
    @new_user.save
    redirect_to("/users/#{@new_user.username}")
  end

  def update
    unique_userid = params.fetch("unique_userid")
    @the_user = User.where({:id => unique_userid}).first
    @the_user.username = params.fetch("input_username")
    @the_user.save
    redirect_to("/users/#{@the_user.username}")
  end
end
