class ContactsController < ApplicationController
  attr_reader :first_name, :last_name, :email, :phone

  def index
   
    @contacts = Contact.all

    # @all_contacts
    # @contacts.each do |person| 
    #    person = "Name: #{person.first_name} #{person.last_name}, Email: #{person.email}, Phone: #{person.phone}"
    # @all_contacts << person
    # end
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone]
    )
    render "create.html.erb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    Contact.update(@contact,
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone]
    )
    render "update.html.erb"
  end

  def destroy
        @contact = Contact.find_by(id: params[:id])

    @contact.destroy
    render "destroy.html.erb"
  end
end
