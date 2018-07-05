class CryptosController < ApplicationController
  before_action :set_crypto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cryptos = Crypto.all
    respond_with(@cryptos)
  end

  def show
    respond_with(@crypto)
  end

  def new
    @crypto = Crypto.new
    respond_with(@crypto)
  end

  def edit
  end

  def create
    @crypto = Crypto.new(crypto_params)
    @crypto.save
    respond_with(@crypto)
  end

  def update
    @crypto.update(crypto_params)
    respond_with(@crypto)
  end

  def destroy
    @crypto.destroy
    respond_with(@crypto)
  end

  private
    def set_crypto
      @crypto = Crypto.find(params[:id])
    end

    def crypto_params
      params.require(:crypto).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end
end
