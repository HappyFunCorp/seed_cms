module SeedCms
  class Entry < ApplicationRecord
    include SeedCms::Concerns::Searchable
    
    scope :published, -> { where('published_at <= ?', Time.zone.now) }

    before_save :set_slug

    def self.content_attr(attr_name, attr_type = :string)
      content_attributes[attr_name] = attr_type

      define_method(attr_name) do
        self.payload ||= {}
        self.payload[attr_name.to_s]
      end

      define_method("#{attr_name}=".to_sym) do |value|
        self.payload ||= {}
        self.payload[attr_name.to_s] = value
      end
    end

    def self.content_attributes
      @content_attributes ||= {}
    end

    def set_slug
      if self.slug.blank?
        self.slug = self.title.downcase.gsub( /[^A-Za-z]/, "_" )
      end
    end
  end
end
