class Document < ActiveRecord::Base

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  attr_reader :file_url

  def file_url
    self.file.url
  end

end
