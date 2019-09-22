class BlogController < ApplicationController

  def index
    @blogs = Blog.all.order("created_at DESC")
  end

  def new
    @blog=Blog.new
    #binding.pry
  end

  def create
#    binding.pry
    Blog.create(title: blog_params[:title],content: blog_params[:content],user_id: current_user.id)
    redirect_to "/blog"
    #@blog=Blog.find(params[:id])
    #binding.pry
  end

  def edit
    @blog=Blog.find(params[:id])  #記載が？
#    binding.pry

  end

  def update
    blog=Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :content) #recommend_book: [:user_id]
    #編集画面は1重だったのにnew画面でform_forでcreateしたらパラムがいきなり２重になった！のでrequire追加
  end

end
