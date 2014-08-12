class AddFieldToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :short_body, :string
  end
end
