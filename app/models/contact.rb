class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :categorized_contacts
  has_many :categories, through: :categorized_contacts
  def japan_phone
    # puts contact.phone
    "81 #{phone}"
  end

  def show_groups
    groups = []
    categories.all.each do |category|
      groups << category.name
    end
    groups.join(", ")
  end
  

end
