<?php

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site speedrun, environment dev
$aliases['dev'] = array(
  'root' => '/var/www/html/speedrun.dev/docroot',
  'ac-site' => 'speedrun',
  'ac-env' => 'dev',
  'ac-realm' => 'prod',
  'uri' => 'speedrundev.prod.acquia-sites.com',
  'remote-host' => 'staging-14821.prod.hosting.acquia.com',
  'remote-user' => 'speedrun.dev',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['dev.livedev'] = array(
  'parent' => '@speedrun.dev',
  'root' => '/mnt/gfs/speedrun.dev/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site speedrun, environment prod
$aliases['prod'] = array(
  'root' => '/var/www/html/speedrun.prod/docroot',
  'ac-site' => 'speedrun',
  'ac-env' => 'prod',
  'ac-realm' => 'prod',
  'uri' => 'speedrun.prod.acquia-sites.com',
  'remote-host' => 'ded-20742.prod.hosting.acquia.com',
  'remote-user' => 'speedrun.prod',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['prod.livedev'] = array(
  'parent' => '@speedrun.prod',
  'root' => '/mnt/gfs/speedrun.prod/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site speedrun, environment test
$aliases['test'] = array(
  'root' => '/var/www/html/speedrun.test/docroot',
  'ac-site' => 'speedrun',
  'ac-env' => 'test',
  'ac-realm' => 'prod',
  'uri' => 'speedrunstg.prod.acquia-sites.com',
  'remote-host' => 'staging-14821.prod.hosting.acquia.com',
  'remote-user' => 'speedrun.test',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['test.livedev'] = array(
  'parent' => '@speedrun.test',
  'root' => '/mnt/gfs/speedrun.test/livedev/docroot',
);
