class Dive < ApplicationRecord
  has_attachments :photos, maximum: 2
end
