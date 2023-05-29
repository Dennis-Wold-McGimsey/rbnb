class AddUserReferencetoFlats < ActiveRecord::Migration[7.0]
  def change
    add_reference :flats, :user, foreign_key: true
  end
end
