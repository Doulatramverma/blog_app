class Message < ApplicationRecord
  belongs_to :user,:optional=>true 
  belongs_to :conversation,:optional=>true 
  #after_create_commit { MessageBroadcastJob.perform_later(self) }
end
