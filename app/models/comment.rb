class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article 
  #associación de unos a muchos
end
