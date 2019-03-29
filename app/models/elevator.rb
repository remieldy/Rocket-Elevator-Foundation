class Elevator < ApplicationRecord
    belongs_to :column

    after_commit do 
        if status == 'intervention'
            sms_elevator()
        end
    end

    
    def sms_elevator()
        require 'twilio-ruby'        
        @client = Twilio::REST::Client.new(ENV['TWILIO_API'], ENV['TWILIO_AUTH'])
        
        message = @client.messages.create(
                                from: '+15877416030',
                                body: "Status of elevator number #{self.id} of column number #{self.column.id} of battery number #{self.column.battery.id} of building at #{self.column.battery.building.address.number_street} in #{self.column.battery.building.address.city} passed to INTERVENTION",
                                to: '+14182153301'
                                )
        
        puts message.sid
    end 
end
