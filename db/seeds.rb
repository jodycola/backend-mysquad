# Destroy all records and reset the primary keys
Player.destroy_all
Player.reset_pk_sequence

# Call API and create instances from API data
responses = Ball.all

responses.each do |response|
    Player.create(
        :id => response["id"],
        :first_name => response["first_name"],
        :last_name => response["last_name"],
        :position => response["position"],
        :plays_for_team => response["team"]["full_name"]
    )
end


puts '================== SEED =================='