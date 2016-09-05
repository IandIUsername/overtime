class PostsController < ApplicationController
    
    #before_action: :find_post, only: (:index, :create, :show, :edit, :destroy)
    
    def index
    
    end
    
    def new
        @post = Post.new
    end
    
    def create
       @post = Post.create(post_params)
       @post.save
       redirect_to post_path(@post)
    end
    
    def show
      @post = Post.find(params[:id])  
    end
    
    private 
    
    def post_params
        params.require(:post).permit(:date, :rationale)
    end
    
    def find_post
       @post = Post.find(params[:id]) 
        
    end
end
