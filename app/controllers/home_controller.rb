class HomeController < ApplicationController
  def index
    @faqs = parse_yaml("#{Rails.root}/static_data/faqs.yml")
  end
end
