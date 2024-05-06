ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :username, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  permit_params :confirmed_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  filter :username
  filter :email

  index do
    selectable_column
    column :id
    column :username
    column :email
    column('Confirmed', sortable: :confirmed_at) { |user| user.confirmed_at.present? }
    column('Microposts', sortable: :microposts) { |user| user.microposts.count }
    column('Subscriptions', sortable: :platforms) { |user| user.platforms.count }

    actions
  end

  show do
    attributes_table do
      row :id
      row :username
      row :email
      row :created_at
      row :confirmed_at
      row(:microposts) { |user| user.microposts.count }
      row(:subscriptions) { |user| user.platforms.count }
    end
  end
end
