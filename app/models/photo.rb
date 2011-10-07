class Photo < ActiveRecord::Base
  belongs_to :lesson

  has_attached_file :image,
    PAPERCLIP_STORAGE_OPTIONS.merge(
    :styles => { :large => "720x480", :normal => "420x315", :small => "120x120" },
    :default_style => :normal  ,
    :default_url => "/images/loading.gif"
    )

end
