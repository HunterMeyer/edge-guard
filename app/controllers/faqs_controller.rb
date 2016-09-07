class FaqsController < ApplicationController
  def index
    @faq = Faq.all
  end
end
