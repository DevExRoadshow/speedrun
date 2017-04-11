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

drush @$site.$target_env status | grep -q 'Successful' && echo -e 'Site already installed. Skipping drush site-install' || drush @$site.$target_env site-install lightning --yes --account-pass=admin && drush @$site.$target_env pm-enable --yes config_split && drush @$site.$target_env config-set --yes "system.site" uuid "426134d7-3f71-415d-ab23-454ddcfdc6b7"

  . /var/www/html/$site.$target_env/vendor/acquia/blt/scripts/cloud-hooks/functions.sh
  deploy_updates
