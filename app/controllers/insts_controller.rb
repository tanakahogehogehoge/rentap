class InstsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inst, only: [:show, :edit, :update, :destroy]

  def index
    @insts = Inst.all
    @inst = Inst.new
  end

  def find

  end

  def new
    @inst = Inst.new
  end

  def show
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
    @inst.destroy
    redirect_to insts_path
  end

  def edit
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
