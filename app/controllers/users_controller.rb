def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
  @posts = Post.where(author: @user).order(id: :asc).limit(2)
end
