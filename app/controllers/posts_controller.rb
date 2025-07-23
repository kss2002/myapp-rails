class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: '게시글을 찾을 수 없습니다.'
  end

  # 게시글 생성
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/posts', notice: '게시글이 성공적으로 생성되었습니다!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  # 게시글 업데이트
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to '/posts', notice: '게시글이 성공적으로 업데이트되었습니다!'
    else
      render :edit
    end
  end

  # 게시글 삭제
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy  
      redirect_to '/posts', notice: '게시글이 성공적으로 삭제되었습니다!'
    else
      redirect_to '/posts', alert: '게시글 삭제에 실패했습니다.'
    end
  end

  # 보안처리 (허용된 파라미터만 허용)
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
