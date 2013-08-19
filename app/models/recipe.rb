class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
	has_many :ingredients, :dependent => :destroy
	validates :name, presence: true, length: { maximum: 50 }
	
	accepts_nested_attributes_for :ingredients, 
																:reject_if => lambda { |a| a[:name].blank? },
                                :allow_destroy => true
end
