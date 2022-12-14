class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  # GET /articles or /articles.json
  def index
    @articles = Article.page(params[:page]).per(6).order(id: :desc)
  end

  # GET /articles/1 or /articles/1.json
  def show
    @group_id = @article.group_id
    session[:article_id] = @article.id
  end

  # GET /articles/new
  def new
    @article = Article.new
    @group_id = session[:group_id]
   
  end

  # GET /articles/1/edit
  def edit
    @group_id = @article.group_id
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    @article.user = current_user
    @article.group_id=session[:group_id]

    respond_to do |format|
      if @article.save

        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      @article.group_id = session[:group_id]
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.comments.ids.clear
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
   
    
 
    @article = Article.find(params[:id])
   
    
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description, :membership_id, :group_id, :image)
  end
end
