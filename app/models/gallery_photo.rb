class GalleryPhoto < ActiveRecord::Base
  belongs_to :gallery
  
  #validates_attachment_presence :image
  #validates_attachment_size :image, :less_than => 5000000
  #validates_attachment_content_type :image, :content_type => ['image/jpeg']
  
end
