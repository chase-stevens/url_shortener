class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by(short: params[:short])
    redirect_to @url.text
  end

  def new
  end

  def create
    @url = Url.new(url_params)
    @url.hashed_num = hash(@url.text)
    @url.short = @url.hashed_num.to_s(36)

    @url.save
    redirect_to @url
  end

  private
    def url_params
      params.require(:url).permit(:text)
    end

    def hash(item)
      offset_basis = 0x811c9dc5
      prime = 16777619
      mask = 4294967295
      table_size = 100000

      hash = offset_basis # Offset basis
      item.to_s.each_byte do |byte|
        hash *= prime
        hash &= mask
        hash ^= byte
      end

      hash = hash % table_size

      return hash

    end
end
