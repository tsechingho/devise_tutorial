class Book < ActiveRecord::Base
  validates :url, :title, :author_id, :presence => true

  belongs_to :author, :class_name => "User"

  has_attached_file :cover_image,
    :style => {
      :thumb => "160x120#"
    }
  validates_attachment_content_type :cover_image,
    :content_type => [ "image/jpeg", "image/png", "image/gif", "image/pjpeg", "image/x-png" ]
  validates_attachment_size :cover_image,
    :less_than => 2.megabytes

  acts_as_url :title

  def to_param
    url
  end
end
