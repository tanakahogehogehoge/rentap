class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    # Instをパラメータの値から探し出し,Instに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @inst = @comment.inst
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to inst_path(@inst), notice: 'コメントを投稿しました' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    set_comment
    @inst = @comment.inst
    respond_to do |format|
      @comment.destroy
        format.html { redirect_to inst_path(@inst) }
          flash.now[:notice] = "コメントが削除されました!"
        format.js { render :index }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to inst_path(@comment.inst_id), notice: 'コメントが修正されました'
        else
            render 'edit'
        end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:inst_id, :content)
    end

    def set_comment
       @comment = Comment.find(params[:id])
    end
end
