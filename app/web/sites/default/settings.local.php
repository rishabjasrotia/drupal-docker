<?php

$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

$settings['config_sync_directory'] = '/var/www/html/config/sync';

if (getenv('KS') == '1') {
    $databases['default']['default'] = [
        'database' => 'drupal',
        'username' => 'drupal_database_user',
        'password' => 'drupal_database_password',
        'prefix' => '',
        'host' => 'mysql.default.svc.cluster.local:3306',
        'port' => '3306',
        'isolation_level' => 'READ COMMITTED',
        'namespace' => 'Drupal\\mysql\\Driver\\Database\\mysql',
        'driver' => 'mysql',
        'autoload' => 'core/modules/mysql/src/Driver/Database/mysql/',
    ];
}

