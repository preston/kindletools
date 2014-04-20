class RemoveEmailRequirement < ActiveRecord::Migration
  def change
  	change_column	:devices,	:email,	:string, null: true
  end
end
