class BlogController < ApplicationController
    def index
        @blogs = Blog.all
    end
    def show
        @blog = Blog.find(params[:id])
    end
    def new
        @blog = Blog.new
    end
    def create
        @blog = Blog.create(blog_params)
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_path
        end
    end
    def destroy
        @blog = Blog.find(params[:id])
        #blog.destroy <-------------- Why is this not needed?
        if @blog.destroy
            redirect_to blogs_path
        else
            redirect_to blog_path(@blog)
        end
    end
    def edit
        @blog = Blog.find(params[:id])
    end

    private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
end
