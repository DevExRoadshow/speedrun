#!/bin/bash
#
# Cloud Hook: post-code-update
#
# The post-code-update hook runs in response to code commits. When you
# push commits to a Git branch, the post-code-update hooks runs for
# each environment that is currently running that branch.
#
# The arguments for post-code-update are the same as for post-code-deploy,
# with the source-branch and deployed-tag arguments both set to the name of
# the environment receiving the new code.
#
# post-code-update only runs if your site is using a Git repository. It does
# not support SVN.

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

  # Fresh install of Lightning if this is a new environment.
  drush @$site.$target_env status | grep -q 'Successful' && echo -e 'Site already installed. Skipping drush site-install' || drush @$site.$target_env site-install lightning --yes --account-pass=admin;

  # Since we can't copy databases into CDEs yet, manually set the site UUID so
  # that we can at least run a config import.
  drush @$site.$target_env config-set --yes "system.site" uuid "426134d7-3f71-415d-ab23-454ddcfdc6b7"
else
  echo 'Target name is: ' $target_env '. Not a CDE';
fi

  . /var/www/html/$site.$target_env/vendor/acquia/blt/scripts/cloud-hooks/functions.sh
  deploy_updates
