class FileKey < ApplicationRecord
  has_and_belongs_to_many :resources
end
