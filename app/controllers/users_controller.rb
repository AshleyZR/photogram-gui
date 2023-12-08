class UsersController < ApplicationController
  def index
    @all_users = User.all.order({:username => :asc})
    render({:templates => "user_templates/index"})
  end

  def show
    unique_username = params.fetch("unique_username")
    @the_user = User.where({:username => unique_username}).first
    render({:templates => "user_templates/show"})
  end

  def add
    @new_user = User.new
    @new_user.username = params.fetch("input_username")
    @new_user.save
    redirect_to("/users/#{new_user.username}")
end
