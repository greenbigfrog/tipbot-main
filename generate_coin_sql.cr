puts "Enter long name (`Dogecoin`)"
name_long = gets
puts "Enter short name/ticker symbol (`DOGE`)"
name_short = gets
puts "Enter discord token (`Bot MzkzND4444444444444444444444444444444444il6wpiHVrle-Yw5eLTA`) "
discord_token = gets
puts "Enter discord client ID (`393444444445475779`)"
discord_client_id = gets
puts "Enter twitch chat password (`oauth:ghpfffffffffffpv3rr79ub8pp0amo`"
twitch_chat_password = gets
puts "Enter twitch OAuth ID (`ct9qnd5r0fffffffffffff7sz9c32`)"
twitch_oauth_id = gets
puts "Enter twitch OAuth token (`mpmgy0keffffffffffffff1oebnwmkq`)"
twitch_oauth_token = gets
puts "Enter prefix (`!`)"
prefix = gets
puts "Enter RPC URL (`http://dogecoind:44555`)"
rpc_url = gets
puts "Enter RPC Username (`a`)"
rpc_username = gets
puts "Enter RPC password (`b`)"
rpc_password = gets
puts "Enter uri scheme (for QR codes) (`dogecoin:`"
uri_scheme = gets
puts "Enter TX fee to deduct at first for withdrawal (`1`)"
tx_fee = gets
puts "Enter amount of confirmations to wait till admitting deposit (`2`)"
confirmations = gets
puts "Enter default min soak (`1`)"
default_min_soak = gets
puts "Enter default min soak total (`5`)"
default_min_soak_total = gets
puts "Enter default min rain (`1`)"
default_min_rain = gets
puts "Enter default min rain total (`5`)"
default_min_rain_total = gets
puts "Enter default min tip (`1`)"
default_min_tip = gets
puts "Enter default min lucky (`1`)"
default_min_lucky = gets
puts "Enter amount of balance when to warn (~1USD) (`1000`)"
high_balance = gets

puts "\n\n\n\n"

puts "docker-compose -f docker-compose.yml -f docker-env.yml exec database psql -U postgres tipbot -c 'INSERT INTO coins (name_long, name_short, discord_token, discord_client_id, twitch_chat_password, twitch_oauth_id, twitch_oauth_token, prefix, rpc_url, rpc_username, rpc_password, uri_scheme, tx_fee, confirmations, default_min_soak, default_min_soak_total, default_min_rain, default_min_rain_total, default_min_tip, default_min_lucky, high_balance)
VALUES (#{name_long}, #{name_short}, #{discord_token}, #{discord_client_id}, #{twitch_chat_password}, #{twitch_oauth_id}, #{twitch_oauth_token}, #{prefix}, #{rpc_url}, #{rpc_username}, #{rpc_password}, #{uri_scheme}, #{tx_fee}, #{confirmations}, #{default_min_soak}, #{default_min_soak_total}, #{default_min_rain}, #{default_min_rain_total}, #{default_min_tip}, #{default_min_lucky}, #{high_balance});'"
