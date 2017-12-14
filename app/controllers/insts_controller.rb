class InstsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inst, only: [:show, :edit, :update, :destroy]

  def index
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?
      @insts = Inst.page(params[:page])
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to new_myp_path
    end
  end

  def new
    @inst = Inst.new
    if @inst.invalid?
      render :new
    end
  end

  def show
    @myp = Myp.find_by(mypid:current_user.id)
    @comment = @inst.comments.build
    @comments = @inst.comments
  end

  def create
    @inst = Inst.new(insts_params)
    @inst.user_id = current_user.id
    if @inst.save
      NoticeMailer.sendmail_inst(@inst).deliver
      redirect_to insts_path
    else
      redirect_to new_inst_path
    end
  end

  def destroy
    @myps = Myp.all
    @myps.each do |myp|
      if @inst.id == myp.applyid
        myp.applyid = 0
        myp.permission = 0
        myp.save
      end
    end
    @inst.destroy
    redirect_to insts_path
  end

  def edit
  end

  def find
    @insts = Array.new
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?
      if request.post? then
        f ='%' + params[:address_search] + '%'
        ff ='%' + params[:style_search] + '%'
        @insts = Inst.where('address like ? and style like ?', f,ff).order 'cost asc'
      end
    else
      redirect_to new_myp_path
    end
  end

  def apply_user
    @myps = Myp.all
    @inst = Inst.find_by(id: params[:id])
  end

  def permit
    @myp = Myp.find_by(id: params[:id])
    @myp.permission = 2
    @myp.save
    redirect_to apply_user_inst_path(id: @myp.applyid)
  end

  def deny
    @myp = Myp.find_by(id: params[:id])
    hoge = @myp.applyid
    @myp.permission = 0
    @myp.applyid = 0
    @myp.save
    redirect_to apply_user_inst_path(id: hoge)
  end

  def update
    @inst.update(insts_params)
    redirect_to insts_path
  end

  private
    def insts_params
      params.require(:inst).permit(:image, :image2, :image3, :image4, :cost, :info, :address, :style, :image_cache, :image2_cache, :image3_cache, :image4_cashe)
    end

    def set_inst
      @inst = Inst.find(params[:id])
    end
end
