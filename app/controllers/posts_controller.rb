class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Your post was delivered successfully!"
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :title, :content, :user_id ])
    end
end
