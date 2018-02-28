class Resource < ApplicationRecord
  belongs_to :user
  has_attached_file :file,
                    resource_type: :raw,
                    path: ":rails_root/public/system/attachment/:style/:filename",
                    url: "/system/attachment/:style/:filename"

  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /.*/
  validates_attachment_size :file, less_than: 30.megabytes
end
