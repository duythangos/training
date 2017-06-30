class AddImageUploadStatusToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :image_upload_status, :boolean
  end
end
