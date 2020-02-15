json.extract! time_card, :id, :time_in, :time_out, :created_at, :updated_at
json.url time_card_url(time_card, format: :json)
