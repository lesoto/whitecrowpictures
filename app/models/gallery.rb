class Gallery < ActiveRecord::Base
  has_many :gallery_photos, :dependent => :destroy#, :order => 'position'
  
  validates_presence_of :title, :keywords, :description, :image_file_name, :image_content_type
  validates_uniqueness_of :title
  validates_length_of :title, :within => 2..100
  validates_length_of :description, :within => 5..1000
  validates_length_of :keywords, :within => 3..200, :allow_blank => true
  #validates_attachment_content_type :image, :content_type => ['image/jpeg']

end
