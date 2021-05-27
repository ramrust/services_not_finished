<?php
/**
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'rulrike' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );


/****************************************************************************/
/**************************Указываем хост нашей бд***************************/
/****************************************************************************/
define( 'DB_HOST', 'mysql-service:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'My_unique_phrase' );
define( 'SECURE_AUTH_KEY',  'My_unique_phrase' );
define( 'LOGGED_IN_KEY',    'My_unique_phrase' );
define( 'NONCE_KEY',        'My_unique_phrase' );
define( 'AUTH_SALT',        'My_unique_phrase' );
define( 'SECURE_AUTH_SALT', 'My_unique_phrase' );
define( 'LOGGED_IN_SALT',   'My_unique_phrase' );
define( 'NONCE_SALT',       'My_unique_phrase' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';