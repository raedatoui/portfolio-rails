class Post < ActiveRecord::Base

  include Draftable
  mount_uploader :thumb, ThumbUploader

end
