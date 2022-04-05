class ListsController < ApplicationController
  def new
    @list = List.new
  end

  #create=新規投稿画面&投稿内容保存
  def create
    list = List.new(list_params)
    list.save
    # redirect_to '/top' を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)  
  end
  
  #index=一覧機能
  def index
    @lists = List.all
  end
  #show=詳細閲覧機能
  def show
    @list = List.find(params[:id])
  end

  #edit=編集機能
  #findメソッドは引数で指定したidのレコードを1件だけ取得するメソッド
  def edit
    @list = List.find(params[:id])
  end
  
  #update=更新機能
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end