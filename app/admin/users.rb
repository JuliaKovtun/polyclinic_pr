ActiveAdmin.register User do
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
end
