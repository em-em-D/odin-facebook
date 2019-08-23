class PostsController < ApplicationController
    before_action :signed_in?, only: [:create, :destroy]
    before_action :current_user, only: :destroy


    def index
        @posts = Post.all
    end


    def new
        @post = Post.new
    end
    def create 
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post created!"
            redirect_to root_url
        else
            flash[:notice] = "unable to create post"
            puts @post.errors.full_messages
        end
    end


    def show
        @post = Post.find(params[:id])
    
    end

    def destroy
        @post.destroy
        flash[:success] = "Post deleted"
        redirect_to request.referrer || root_url
    end

    private

    def post_params
      params.permit(:content)
    end




end    