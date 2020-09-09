class UrlsController < ApplicationController

  def index
    @urls = Url.all
    @button_click = Button.first.clicks
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find_by(look_up: params[:look_up])
    redirect_to @url.original_url
  end

  def create
    click
    shortener = Shortener.new(url_params[:original_url])
    @url = shortener.generate_short_link

    if @url.persisted?
      respond_to :js
    else
      render 'error.js.erb'
    end
  end

  def click
    @button = Button.find(1)
    @newcount = @button.clicks + 1
    Button.find(1).update_attributes(:clicks => @newcount)
  end

  private
  def url_params
    params.require(:url).permit(:original_url)
  end
end
