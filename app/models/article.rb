class Article < ActiveRecord::Base	
	has_many :comments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates :title, presence: true, length: { minimum: 5 }		

  def create_file(article)
    file = File.open("/#{Rails.root}/export_file/#{article.title}.txt", "w") do |f|
      f.write "The content of article is #{article.text}"
      puts "Write file OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
      f.close
      puts "File is close OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
    end
  end  

end
