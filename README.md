                 _       _                 _
     _ __   ___ (_)_ __ | |_   _ __   ___ | | _____ _ __
    | '_ \ / _ \| | '_ \| __| | '_ \ / _ \| |/ / _ \ '__|
    | |_) | (_) | | | | | |_  | |_) | (_) |   <  __/ |
    | .__/ \___/|_|_| |_|\__| | .__/ \___/|_|\_\___|_|
    |_|                       |_|

# Point Poker - estimating for agile teams

# OSX Setup instructions

Install gem dependencies with bundler:

    bundle install

Install postgresql, then follow the brew instructions:

    brew install postgresql

Create the database:

    bundle exec rake db:create db:schema:load

Start the server:

    bundle exec rails s

# websocket eventual consistency design

The client stores the lock\_version value of the game. Websocket events
just send new lock\_version values. The client asks for json that
includes all the new stuff since its known lock version, and iterates
through that and renders it on the page.
