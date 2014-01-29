class PostsController < ApplicationController

  respond_to :html, :js

  def index
    # move this to after save in activeadmin
    @bio = AdminUser.first.render
    @posts = Post.find(:all, :order => "display_order")
  end

  def show
    @post = Post.find(params[:id])
    render :partial => 'posts/show'
  end

end
