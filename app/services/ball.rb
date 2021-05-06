class Ball
    # LOOP FOR API CALL TO RECEIVE ALL PLAYER DATA FOR RAILS DB
    def self.all
        players = []
        i = 1
        while i < 35 do
            responses = HTTParty.get("https://www.balldontlie.io/api/v1/players/?page=#{i}&per_page=100/")["data"]
            responses.each { |response| players << response }
            i = i + 1
        end
        return players
    end
    
end