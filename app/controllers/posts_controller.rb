class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    # createアクションを追加
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            # 更新された場合、一覧画面へ遷移
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
