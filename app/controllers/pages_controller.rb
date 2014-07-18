class PagesController < ApplicationController
  before_action :require_user

  def writing
    @post_today = current_user.posts.today
  end

  def profile
    @posts = current_user.posts
    @points = @posts.sum(:points)
  end

  def archive
    @posts = current_user.posts
  end
end
