class AdPhoto < ActiveRecord::Base
  attr_accessible :id, :parent_id, :user_id, :created_at, :updated_at, :current_user_id
  has_attachment :content_type => :image,
  :storage => :file_system,
  :size => 0.megabyte..2.megabytes,
  :resize_to => '450x450',
  :thumbnails => { :thumb => '150x150'}
end
