class MypsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_myp, only: [:edit, :update]
  require "date"

  def index
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?
      @insts = Inst.all
      @myps = Myp.all
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
    @myp.applyid = 0
    @myp.permission = 0
    if @myp.save
      redirect_to myps_path, notice:"個人情報が登録または変更されました"
    else
      render 'new'
    end
  end

  def show
    @myp = Myp.find_by(mypid:current_user.id)
    if @myp.present?

    else
      redirect_to new_myp_path, notice:"マイページを作成してください"
    end
  end

  def edit
  end

  def update
    @myp.update(myps_params)
    redirect_to myp_path
  end

  def apply_store
    @myps = Myp.all
    @myp = Myp.find_by(mypid:current_user.id)
    hoge = params[:inst_id]
    unless @myp.applyid == 0
      redirect_to myps_path, notice:"すでに物件を申し込んでいます, 自身でキャンセルするかオーナ様の不許可をお待ちください"  # 物件を申し込んでマイページの頭に飛ぶ
    else
      @myp.applyid = hoge
      @myp.permission = 1 # 許可待ち状態へ
      @myp.save
      # redirect_to myps_path, notice:"物件に申し込みました、オーナ様の許可をお待ちください" # 物件を申し込んでマイページの頭に飛ぶ
    end
  end

  def cancel_store
    @myp = Myp.find_by(mypid:current_user.id)
    @myp.permission = 0
    @myp.applyid = 0
    @myp.save
    redirect_to myps_path, notice:"応募物件をキャンセルしました！"
  end

  def confirm
    @myp = Myp.new(myps_params)
    render :new if @myp.invalid?
  end

  private
    def myps_params
      params.require(:myp).permit(:uname, :uaddress, :ubankaccount, :mypid, :applyid, :avatar, :uemail, :data, :endtime, :starttime)
    end

    def set_myp
      @myp = Myp.find(params[:id])
    end
end
