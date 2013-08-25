class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
	has_many :ingredients, :dependent => :destroy
	validates :name, presence: true, length: { maximum: 50 }
	
	accepts_nested_attributes_for :ingredients, 
																:reject_if => lambda { |a| a[:name].blank? },
                                :allow_destroy => true


	def tags_string
		tags_string = ""
		if self.quickneasy
			tags_string = "Quick n Easy, "
		end
		if self.leftovers
			tags_string = tags_string + "Good for Leftovers, "
		end
		if self.kidfav
			tags_string = tags_string + "Kid Favorite, "
		end
		if self.xmas
			tags_string = tags_string + "Christmas, "
		end
		if self.grill
			tags_string = tags_string + "Grilling, "
		end
		if self.turkey
			tags_string = tags_string + "Thanksgiving Staple, "
		end
		if self.lite
			tags_string = tags_string + "Lite n Fit, "
		end
		if self.summer
			tags_string = tags_string + "Summer Treat"
		end
		return tags_string
	end
	
end
