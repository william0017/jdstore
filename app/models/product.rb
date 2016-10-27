class Product < ApplicationRecord

  mount_uploader :picture, AttachmentUploader

end
