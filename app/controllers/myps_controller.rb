class MypsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_myp, only: [:edit, :update]
  require "date"

  def index
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?
      @insts = Inst.all
    else
      redirect_to new_myp_path
    end
  end

  def new
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?
      redirect_to myps_path, notice:"すでにプロフィールを作成済みです！"
    else
      if params[:back]
        @myp = Myp.new(myps_params)
      else
        @myp = Myp.new
      end
    end
  end

  def create
    @myp = Myp.create(myps_params)
    @myp.mypid = current_user.id
    if @myp.save
      redirect_to myps_path, notice: "マイペクリエアクション"
    else
      render 'new'
    end
  end

  def show
    @myp = Myp.find_by(mypid:current_user.id)
  end

  def edit
  end

  def update
    @myp.update(myps_params)
    redirect_to myp_path
  end

  def apply_store
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.applyid.present?
      redirect_to myps_path, notice:"すでに物件を申し込み済みです！"
    else
      @myp.applyid = params[:inst_id]
      @inst= Inst.find(params[:inst_id])
      @myp.save
      redirect_to myps_path
    end
  end

  def cancel_store
    @myp = Myp.find_by(mypid:current_user.id)
    @myp.applyid = nil
    @myp.save
    redirect_to myps_path, notice:"登録物件をキャンセルしました！"
  end

  def confirm
    @myp = Myp.new(myps_params)
    render :new if @myp.invalid?
  end

  private
    def myps_params
      params.require(:myp).permit(:uname, :uaddress, :ubankaccount, :mypid, :applyid)
    end

    def set_myp
      @myp = Myp.find(params[:id])
    end
end
