class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
      # 一覧画面へ遷移して"写真を投稿しました！"とメッセージを表示します。
      redirect_to pictures_path, notice: "写真を投稿しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture.update(pictures_params)
    redirect_to pictures_path, notice: "写真を編集しました！"
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "写真を削除しました！"
  end

  def confirm
    @picture = Picture.new(pictures_params)
    render :new if @picture.invalid?
  end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content)
    end

    # idをキーとして値を取得するメソッド
    def set_picture
      @picture = Picture.find(params[:id])
    end
end
