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
define( 'AUTH_KEY',          'p0)G8Nm=Wm.xOvI;[,)N 7Vm-tRB8EwJR7*yCzB1ozku[1=Tmh->[XMNZI*BmzQr' );
define( 'SECURE_AUTH_KEY',   ')_dWChK$}O& /0&9.Lm~yVrad(5M3Gd50YHz9aG;`i_HZd{$;G{qA18]!`xZj>i/' );
define( 'LOGGED_IN_KEY',     'SP)6}|<Mj!r9/f#LPQJ<y8=bPhK5F_4<^p^IP}]&R~Hf3~k8K*%+0-&Ee+@>;_=)' );
define( 'NONCE_KEY',         'uw_*P~vDZW3KxZC-~`rFx1}:}/gf<*@6bN4SbjP^HduC4+QJ(RQTAOGMG{G>.i*?' );
define( 'AUTH_SALT',         '@`r3=yc4iu]Vn#_BQMh^6!g%V*?XIDhtcG9MtA-8}I5H}gSr[R,%0*=@8hmmX$L[' );
define( 'SECURE_AUTH_SALT',  '/P0<2:u{K1>YR23gW@i1C7~[Dv:-+`jlC,~k7i}fg)o0UCF!9Qp9u<BWc.]ao<JQ' );
define( 'LOGGED_IN_SALT',    'X:xjS*FH}{PF~NFT@vmKlU(df0|[]$NU=B.LQbw?elBfJ(y49oY_,ON{%r4(0Z]X' );
define( 'NONCE_SALT',        '7[xL)z>(BqjTyfobG9vY<hJuNY,<51T8Q; 3vwx 9dph,p=}tCy/Lir]wrk;9l<r' );
define( 'WP_CACHE_KEY_SALT', ')jFZhxa,Me9VQsdW2@8?-R4N@H)#.]UN+S 3ePE|k?T/g?ZY*`({3M INQJ&`a=8' );


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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
