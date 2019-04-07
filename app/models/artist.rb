class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods


  def slug
    @slug = self.name.strip.downcase.gsub(" ","-")
  end



  def self.find_by_slug(slug)
    name = "#{slug.gsub("-"," ")}".split.map(&:capitalize).join(" ")
    self.all.detect {|name| name.slug == slug}
  end

end
