class AddCompanyReferenceToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :company, null: false, foreign_key: true
  end
end
