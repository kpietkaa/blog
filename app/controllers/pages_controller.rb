class PagesController < ApplicationController
  before_action :set_locale
  def about
  end

  private
  def set_locale
    I18n.locale = :pl
  end
end
