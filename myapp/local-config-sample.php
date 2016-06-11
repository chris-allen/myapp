<?php
/*
This is a sample local-config.php file
In it, you *must* include the four main database defines

You may include other settings here that you only want enabled on your local development checkouts
*/

define( 'DB_NAME', '<%= @config["DB_NAME"] %>' );
define( 'DB_USER', '<%= @config["DB_USER"] %>' );
define( 'DB_PASSWORD', '<%= @config["DB_PASSWORD"] %>' );
define( 'DB_HOST', '<%= @config["DB_HOST"] %>' );
