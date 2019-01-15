class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:short].to_i(36))
  end

  def goto
    @url = Url.find(params[:short].to_i(36))
    redirect_to @url.text
  end

  def new
  end

  def create
    @url = Url.new(url_params)
    @url.hashed_num = hash(@url.text)

    bucket = Url.find_by(id: @url.hashed_num)

    while true
      if !bucket
        @url.id = @url.hashed_num
        break
      elsif bucket.text == @url.text
        flash[:notice] = "URL already exists"
        redirect_to bucket and return
      else
        @url.hashed_num += 1
      end
    end

    @url.short = @url.id.to_s(36)
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
      table_size = 46655 # keeps urls down to 3 digits

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
