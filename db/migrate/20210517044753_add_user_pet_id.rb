class AddUserPetId < ActiveRecord::Migration[6.0]
  def change
    add_reference :interests, :user_pet, foreign_key: { to_table: :pets }
  end
end
