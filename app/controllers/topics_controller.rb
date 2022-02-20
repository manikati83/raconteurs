class TopicsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @topics = Topic.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    if logged_in?
      @topic = current_user.topics.build
    end
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @topics = Topic.order(id: :desc).page(params[:page]).per(25)
      flash[:danger] = '投稿に失敗しました。'
      render 'topics/index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @topic.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def tags
    @tag = Hashtag.find(params[:id])
    @topics = @tag.topics.order(id: :desc).page(params[:page]).per(25)
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title, :content, :hashbody, hashtag_ids: [])
  end
  
  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    unless @topic
      redirect_to root_url
    end
  end
  
end
