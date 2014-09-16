class ChangeColumnForPublications < ActiveRecord::Migration
  def change
    change_column(:publications, :short_body, :text)
  end
end
