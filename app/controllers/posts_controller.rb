class PostsController < ApplicationController
    before_action :signed_in?, only: [:create, :destroy]
    before_action :current_user, only: :destroy

    def create 
        @post = current_user.posts.build(:content)
        if @post.save
            flash[:success] = "Post created!"
            redirect_to root_url
        end
    end

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        #post = Post.new(user: @user)
    end

    def destroy
        @post.destroy
        flash[:success] = "Post deleted"
        redirect_to request.referrer || root_url
    end





end    