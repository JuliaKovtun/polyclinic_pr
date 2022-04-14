ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :phone, :first_name, :last_name
  #
  permit_params :email, :first_name, :last_name, :phone, :password, :password_confirmation

  index do
    column :email
    column :first_name
    column :last_name
    column :phone
    column :remember_created_at
    actions
  end

  form do |f|
    f.inputs :email, :first_name, :last_name, :phone, :password, :password_confirmation
    f.button :Submit
  end

  # or
  #
  # permit_params do
  #   permitted = [:email, :password, :password_confirmation, :phone, :first_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
