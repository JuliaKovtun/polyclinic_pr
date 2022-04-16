ActiveAdmin.register Doctor do
  permit_params :email, :first_name, :last_name, :phone, :password, :password_confirmation, :category_id
  
  index do
    column :email
    column :first_name
    column :last_name
    column :phone
    column :category
    column :remember_created_at
    actions
  end

  form do |f|
    f.inputs :email, 
             :first_name, 
             :last_name, 
             :phone, 
             :password, 
             :password_confirmation,
             :category #, as: :select, collection: Category.select(:title).uniq
    f.button :Submit
  end
end
