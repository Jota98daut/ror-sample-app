ActiveAdmin.register Micropost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :user_id, :platform_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :user_id, :platform_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :image_attachment, :image_blob, :created_at, :updated_at

  index do
    selectable_column
    column :id
    column('Content') { |micropost| micropost.short_content(40) }
    column :user
    column :platform

  end
end
