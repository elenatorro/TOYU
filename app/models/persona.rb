class Persona < ActiveRecord::Base
	belongs_to :project
	has_one :scenario, :dependent => :destroy
	has_attached_file :image, 
					  :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
					  :default_url => "missing.png",
					  :dependent => :destroy
                      


    validates_attachment_content_type :image, 
    								  :content_type => /\Aimage\/.*\Z/, 
    								  :size => { :in => 0..1.megabytes }

	validates :name, presence: true, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ }

	validates :location, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ }

	validates :gender, inclusion: {in: ['Male','Female']}
end
