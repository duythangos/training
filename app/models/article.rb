class Article < ActiveRecord::Base	
	has_many :comments
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates :title, presence: true, length: { minimum: 5 }	

	def status		
    	update_column :image_upload_status, true    	
  	end

  	def to_csv
    CSV.generate do |csv|
      csv << self.attributes.keys       
      csv << self.attributes.values_at(*self.attributes.keys)      
    end
  end  

end
