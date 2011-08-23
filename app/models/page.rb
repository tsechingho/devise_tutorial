class Page < ActiveRecord::Base
  validates :url, :title, :presence => true

  acts_as_url :title

  def to_param
    url
  end
end
