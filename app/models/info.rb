class Info < ActiveRecord::Base
	has_attached_file :image, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	default_scope {order('created_at DESC')}

  	belongs_to :user
end
