class Category < ActiveRecord::Base
  has_many :categorized_contacts
  has_many :contacts, through: :categorized_contacts
end
