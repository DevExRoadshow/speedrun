#!/bin/bash
#
# Cloud Hook: post-code-deploy
#
# The post-code-deploy hook is run whenever you use the Workflow page to
# deploy new code to an environment, either via drag-drop or by selecting
# an existing branch or tag from the Code drop-down list. See
# ../README.md for details.
#
# Usage: post-code-deploy site target-env source-branch deployed-tag repo-url
#                         repo-type

site="$1"
target_env="$2"
source_branch="$3"
deployed_tag="$4"
repo_url="$5"
repo_type="$6"

re="^ode*"
if [[ $target_env =~ $re ]]
then
  echo 'Target name is: ' $target_env '. This is a CDE.';

  # Start with a fresh install of Lightning.
  drush @$site.$target_env status | grep -q 'Successful' && echo -e 'Site already installed. Dropping DB so we can reinstall.' && drush @$site.$target_env sql-drop --yes || echo -e 'Site not installed, proceeding.'
  drush @$site.$target_env site-install lightning --yes --account-pass=admin;

  # Since we can't copy databases into CDEs yet, manually set the site UUID so
  # that we can at least run a config import.
  drush @$site.$target_env config-set --yes "system.site" uuid "426134d7-3f71-415d-ab23-454ddcfdc6b7"
else
  echo 'Target name is: ' $target_env '. Not a CDE';
fi

  . /var/www/html/$site.$target_env/vendor/acquia/blt/scripts/cloud-hooks/functions.sh
  deploy_updates
