require_dependency "seed_cms/application_controller"

module SeedCms
  class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :check_access

    def index
      @entries = Entry.where(type: content_class)
    end

    def show
      render :edit
    end

    def new
      @entry = Entry.new(type: content_class)
    end

    def edit
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to content_entries_path, notice: 'Entry was successfully created.'
      else
        render :new
      end
    end

    def update
      if @entry.update(entry_params)
        redirect_to content_entries_path, notice: 'Entry was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @entry.destroy
      redirect_to content_entries_path, notice: 'Entry was successfully destroyed.'
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      allowed_attrs = %i(id type title slug published_at)
        .concat(content_class.constantize.content_attributes.keys)

      params.require(:entry).permit(*allowed_attrs)
    end

    def content_class
      @content_class ||= params[:content_class].classify
    end
    helper_method :content_class

    def check_access
      case action_name
      when 'index'
        unless can? :read, content_class
          redirect_to '/', flash: { error: "You can't read content" }
        end
      when 'new', 'create'
        unless can? :create, content_class
          redirect_to '/', flash: { error: "You can't create content" }
        end
      when 'show'
        unless can? :read, @entry
          redirect_to '/', flash: { error: "You can't read content" }
        end        
      when 'edit', 'update'          
        unless can? :update, @entry
          redirect_to '/', flash: { error: "You can't update content" }
        end
      when 'destroy'
        unless can? :destroy, @entry
          redirect_to '/', flash: { error: "You can't destroy content" }
        end
      else
        throw "Unknown action #{action_name}"
      end
    end
  end
end