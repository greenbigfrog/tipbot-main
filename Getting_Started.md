# Getting Started
## Be cautious. This guide is only meant for personal reference, and in no way claims to be complete

# Accounts etc
## Twitch
- Create a single OAuth app to use across the whole application (note Client ID and secret)
- Create a account for each bot and note the chat password generated at https://twitchapps.com/tmi/
## Discord
- Create a single App for the purpose of OAuth (note Client ID and secret)
- Create a app for each bot and note the bot token

# Actual starting
1. Clone this repo
2. Edit/add the coin configs you plan on using (eg `dogecoin.conf`) and set up coins in `docker-compose.yml` (service and volume)
3. Edit `docker-env.yml` (Check comments in file for instructions)
4. Edit `.env` to set grafana and http auth password
5. Create docker volumes for all coins (eg `docker volume create dogecoin`)
6. Create docker volumes for postgres and monitoring (`docker volume create postgres && docker volume create prometheus_data && docker volume create grafana_data`)
7. Launch coin wallets: `docker-compose -f docker-compose.yml -f docker-env.yml up -d dogecoind database redis`
8. Launch monitoring stack: `docker-compose -f docker-compose.yml -f docker-env.yml up -d prometheus alertmanager nodeexporter redis_exporter sql_exporter cadvisor grafana caddy`
9. Insert coins into database (generate SQL using script: `crystal run generate_coin_sql.cr`)
10. Launch website, discord, twitch, worker: `docker-compose -f docker-compose.yml -f docker-env.yml up -d website discord twitch worker`


### Commands
Monitoring stack logs: `docker-compose logs -f prometheus alertmanager nodeexporter redis_exporter sql_exporter cadvisor grafana caddy`
psql: `docker-compose -f docker-compose.yml -f docker-env.yml exec database psql -U postgres tipbot`
