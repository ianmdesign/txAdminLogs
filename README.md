# txAdminLogs
Simple Standalone txAdmin Logs made for FiveM

This is an updated version of jhag01's [txAdminLogs](https://github.com/jhag01/txAdminLogs) project, made compatible with txAdmin version 5.2.0. Here are some of the key changes that have been made:

- Updated the fxmanifest.lua file to use the games function instead of game, as required by txAdmin 5.2.0, along with other additions made to support txAdmin Events.
- Updated the readme.md file to include more detailed instructions and information about the modifications made to the original project.

## Installation

1. Clone or download this repository.
2. Drag and drop the `txAdminLogs` folder into your `resources` folder.
3. Add the line `ensure txAdminLogs` to your `server.cfg` file.
4. Modify the `config.lua` file to fit your needs.

## Features

This script logs the following events and sends them to a Discord webhook:
- Player kicked
- Player warned
- Player banned
- Player unbanned
- Warning revoked
- Player healed
- Server announcement
- Direct message
- Scheduled restart
- Whitelist pre-approval added/removed
- Whitelist request
- Whitelist request approved/denied
- Whitelist request all denied
- Whitelist player added/removed

## Configuration

You can modify the `config.lua` file to change the Discord webhook, username, and avatar used for logging.

## Disclaimer

Feel free to modify for personal usage, but do not distribute it for any amount of money.

## License

This project is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0) license. You are free to use and share this project for personal use, but you are not allowed to modify or distribute it commercially without permission from the original author.
