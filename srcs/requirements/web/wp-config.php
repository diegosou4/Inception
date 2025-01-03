<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'diegmore' );

/** Database password */
define( 'DB_PASSWORD', 'Diegoaguia7@' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'LdcM|(BC5HO,Gu;6)]xkMkRmfnIjlh_3$kext-G[9<AL2J6D$c/N*U`87>AfSd>{' );
define( 'SECURE_AUTH_KEY',   'RgU+;?&O!EaYK<=u})d/` v2TA#j`aVfZYc=Q(0w&!C@/@(zbob?Proi+U4#^D?}' );
define( 'LOGGED_IN_KEY',     'bf@a/o*^hHGVJkx6xd72IV.XgSUU4}:Y(T^7}<s/[:|8v*Mp%OQB!}cOaN+O$Tv%' );
define( 'NONCE_KEY',         'J.LbUq-e]xpX+4R*=QMZR(`1V8[]-:R_jhW16<,y;!kG<9(q]_&d|q,zV4zw##eu' );
define( 'AUTH_SALT',         'ND6 AC:S`{i_~]3l7g;fz)o~#$9RTdY|?3?>#V?Ho?ZVH!AkwjMT)kOo(w?_$<y;' );
define( 'SECURE_AUTH_SALT',  'i=U-<2Vx~<N4BcCCDbXeFE_f@$^UTfSxr{:lh[XW+1jl<*dL~7$?_FU9hzC+cA13' );
define( 'LOGGED_IN_SALT',    'L#>a!lWzNaM%L)! 0-)R%mB_D@4$0`YGB;)F,tM[Kbb7GZ/?3O,]Yi<j_+=q)r38' );
define( 'NONCE_SALT',        'Gs| G|,4~(o/V5>o[^73KR;nQ)d}%)-HZSk{vGx(x__d`?I-PD?mtQ$PMTt:sc;#' );
define( 'WP_CACHE_KEY_SALT', ')-]MF{r:Vh  w3pWUAsI8`LR0<$r<NZL6(.I%O21zmK-PEtg{{a_j_vz)@be5zeB' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );
define( 'FS_METHOD', 'direct' );
define( 'WP_CACHE', 'true' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
