class Resource < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :file_key, dependent: :destroy
  has_attached_file :file,
                    resource_type: :raw,
                    path: ":rails_root/public/system/attachment/:style/:id",
                    url: "/system/attachment/:style/:id"

  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /.*/
  validates_attachment_size :file, less_than: 30.megabytes
end
