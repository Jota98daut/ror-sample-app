ActiveAdmin.register User do

  permit_params :username, :email, :confirmed_at
  
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
