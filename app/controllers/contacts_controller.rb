class ContactsController < ApplicationController
  attr_reader :first_name, :last_name, :email, :phone

  def index
    if current_user && params[:category]
      
      @contacts = Category.find_by(name: params[:category]).contacts
      
      render "index.html.erb"
    
    elsif current_user
      @contacts = current_user.contacts
      render "index.html.erb"

    else 
      redirect_to '/users/sign_up'
    end    
  end

  def new
    render "new.html.erb"
  end

  def create
    address = params[:address]
    if address == nil
      address = "123 North ave."
    end
    coordinates = Geocoder.coordinates(address)

    Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      latitude: coordinates[0],
      longitude: coordinates[1],
      bio: params[:bio],
      user_id: current_user.id
    )
    redirect_to "/contacts/#{params[:id]}"
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
    address = params[:address]
    if address == nil
      address = "123 North ave."
    end
    coordinates = Geocoder.coordinates(address)

    @contact = Contact.find_by(id: params[:id])
     Contact.update(@contact,
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      latitude: coordinates[0],
      longitude: coordinates[1],
      bio: params[:bio]
     ) 
    redirect_to "/contacts/#{params[:id]}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    redirect_to "/contacts/"
  end
end
