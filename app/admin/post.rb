ActiveAdmin.register Post do
  sortable tree: false, # default
           sorting_attribute: :display_order
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :slug, :description, :images, :admin, :thumb, :published_state, :publisher_id, :display_order, :published_at, :slide_width, :project_url

  config.sort_order = "display_order_desc"
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  # index do
  #   column "Thumb" do |post|
  #       image_tag post.thumb.fill, width: 75, height: 75
  #   end
  #   column :title
  #   column :slug
  #   column :published_state
  #   default_actions
  # end

  index :as => :sortable do
    label :title
    label :thumb do |post|
      image_tag post.thumb.fill, width: 75, height: 75
    end
    actions
  end

  form do |f|
    f.inputs "Edit Post" do
      f.input :title
      f.input :slug
      f.input :display_order
      f.input :slide_width
      f.input :project_url
      f.input :published_at, as: :datepicker
      f.input :thumb, as: :file, hint: f.object.thumb.nil? ? "" : f.template.image_tag(f.object.thumb.url)
      f.input :published_state, as: :select, collection: [:published, :draft]
      f.input :description, input_html: {class: 'ckeditor'}
      f.input :images, input_html: {class: 'ckeditor'}
    end
    f.actions
  end

  show do
    div :class => 'panel' do
      h3 post.id
      div :class => 'post_contents' do
        div :class => "attributes_table post", :id => "attributes_table_post" do
          table do

            tr do
              th "Thumb"
              td  image_tag post.thumb.fill, width: 75, height: 75
            end

            ["title", "slug", "slide_width", "display_order", "published_state", "published_at", "created_at", "updated_at"].each do |column|
              tr do
                th column
                td post.send(column.to_sym).to_s
              end
            end

            tr do
              th "Description"
              td raw(post.description)
            end
            tr do
              th "Images"
              td raw(post.images)
            end
          end
        end
      end
    end
  end
end
