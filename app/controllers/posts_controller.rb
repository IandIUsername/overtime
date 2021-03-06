class PostsController < ApplicationController
    
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        
    #@posts = current_user.posts
    
      #if current_user.type == 'admin'
          #@posts = Post.all
      #else
         @posts = Post.posts_by current_user 
      #end
    
    end
    
    def new
        @post = Post.new
    end
    
    def create
       @post = Post.create(post_params)
       @post.user_id = current_user.id
       if @post.save
         redirect_to post_path(@post), notice: "Your post was created sucsessfully"
       else 
           render :new
       end
    end
    
    def edit
        authorize @post
    end
    
    def update
        authorize @post
        if @post.update(post_params)
          redirect_to post_path(@post), notice: "Your post was updated sucessfully"
        else
          render "edit"
        end
    end
    
    def show
      @post = Post.find(params[:id])  
    end
    
    def destroy
        @post.delete
        redirect_to posts_path, notice: "Post gone bye-bye"
        
    end
    
    
    private 
    
    def post_params
        params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end
    
    def set_post
       @post = Post.find(params[:id]) 
        
    end
end
