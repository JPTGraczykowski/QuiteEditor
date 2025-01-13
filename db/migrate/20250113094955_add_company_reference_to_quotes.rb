class AddCompanyReferenceToQuotes < ActiveRecord::Migration[8.1]
  def change
    add_reference :quotes, :company, null: false, foreign_key: true
  end
end
