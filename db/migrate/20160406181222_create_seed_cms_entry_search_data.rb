class CreateSeedCmsEntrySearchData < ActiveRecord::Migration[5.0]
  def change
    create_table :seed_cms_entry_search_data do |t|
      t.integer :entry_id
      t.string :attr_name
      t.tsvector :search_data

      t.timestamps null: false
    end

    execute 'create index idx_search_data on seed_cms_entry_search_data using gin(search_data)'
  end
end
