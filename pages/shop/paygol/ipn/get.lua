function get()
    if not app.Mode == "dev" then
        if http:getRemoteAddress() ~= "109.70.3.48" or http:getRemoteAddress() ~= "109.70.3.146" or http:getRemoteAddress() ~= "109.70.3.210" then
            return
        end
    end

    local transaction_id = http.getValues['transaction_id'];
    local service_id = http.getValues['service_id'];
    local shortcode	= http.getValues['shortcode'];
    local keyword = http.getValues['keyword'];
    local message = http.getValues['message'];
    local sender = http.getValues['sender'];
    local operator = http.getValues['operator'];
    local country = http.getValues['country'];
    local custom = http.getValues['custom'];
    local points = http.getValues['points'];
    local price	= http.getValues['price'];
    local currency = http.getValues['currency'];

    if tonumber(service_id) ~= app.PayGol.Service then
        return
    end

    db:execute("UPDATE castro_accounts AS a, (SELECT id FROM accounts WHERE name = ?) AS b  SET a.points = a.points + ? WHERE a.account_id = b.id", custom, points)
end