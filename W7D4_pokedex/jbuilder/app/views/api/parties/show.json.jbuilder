json.partial! 'api/parties/party', party: @party

json.guests do
  json.array! @party.guests.each do |guest|
    json.partial! 'api/guests/show', guest: guest      
  end
end
