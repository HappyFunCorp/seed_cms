module SeedCms
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def content_entry_path( entry )
      if entry && entry.id
        entry_path( content_class: content_class.tableize, id: entry.id)
      else
        entries_path( content_class: content_class.tableize )
      end
    end
    helper_method :content_entry_path

    def edit_content_entry_path( entry )
      edit_entry_path( content_class: content_class.tableize, id: entry.id)
    end
    helper_method :edit_content_entry_path

    def content_entries_path
      entries_path(content_class: content_class.tableize)
    end
    helper_method :content_entries_path
  end
end
