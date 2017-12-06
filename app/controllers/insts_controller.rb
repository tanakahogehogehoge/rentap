class InstsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inst, only: [:show, :edit, :update, :destroy]

  def index
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?
      @insts = Inst.all
    else
      redirect_to new_myp_path
    end
  end

  def new
    @inst = Inst.new
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
        myp.applyid = nil
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
        @insts = Inst.where('address like ? and style like ?', f,ff)
      end
    else
      redirect_to new_myp_path
    end
  end

  def update
    @inst.update(insts_params)
    redirect_to insts_path
  end

  private
    def insts_params
      params.require(:inst).permit(:image, :cost, :info, :address, :style, :searchaddress, :searchstyle)
    end

    def set_inst
      @inst = Inst.find(params[:id])
    end
end
