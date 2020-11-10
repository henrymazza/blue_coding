class PagesController < ApplicationController
  # FIXME: ActionController::InvalidAuthenticityToken
  skip_before_action :verify_authenticity_token

  def index
    @pages = Page.all.order('hits desc')
  end

  def create
    @page = Page.new(full_url: page_params[:full_url])
    redirect_to :index
  end

  def show
    @page = Page.find_by(short_url: page_params[:short_url])
    if @page
      @page.hits = @page.hits + 1
      @page.save
      redirect_to @page.full_url
    else
      render html: '<h2>Error!</h2>'.html_safe
    end
  end

  private

  def page_params
    params.permit(:short_url, :full_url)
  end
end
