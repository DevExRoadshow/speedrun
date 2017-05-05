# Developer Experience Roadshow Demo

Ths project is used to demo Acquia's Developer Products including:

* [BLT](https://github.com/acquia/blt)
* [Lightning](https://drupal.org/project/lightning)
* [Pipelines](https://docs.acquia.com/pipelines)
* [Continuous Delivery Environments (CDEs)](https://www.acquia.com/products-services/acquia-cloud-cd)

## Project workflow

### Local
1. Make code change locally (require new module)
1. Make config change locally (enable new module)
1. Write functional test that proves your changes
1. Run tests locally
1. Export config locally

    > You now have three changes in your repo: composer.json/lock have reference
      to the new module, the fact that the module is enabled is reflected in
      core.extensions.yml config file, and you have a new test in your codebase.

1. Commit these changes to a feature branch
1. Push these changes to GitHub repo

### Pipelines
1. Pipelines reacts to commit and initiates a build
    1. App is build from composer
    1. Drupal is installed
    1. Production database is copied
    1. Existing tests and new test are run
1. Upon successful test execution, pipelines builds an artifact of the codebase
   and pushes to an artifact branch on the Acquia Cloud repo
1. Artifact branch is deployed to a new Continuous Delivery Environment (CDE)

### Cloud CDE
1. Cloud hooks react and install application in CDE
1. ~~Production database is sanitized and cloned into CDE~~ Not currently
   possible. Instead:
    1. Force set site UUID so that it matches production
    1. Import config
    1. Same result, but no content

### Next steps:
1. Note that automated tests pass via GitHub integration (green check mark next
   to branch/PR)
1. Review code on GitHub
1. Manual review changes to application in CDE
1. Merge the branch/PR (CDE is automatically deleted once PR is merged)

## Resources

* [GitHub](https://github.com/DevExRoadshow/speedrun)
* [User Stories](https://github.com/DevExRoadshow/documentation/blob/master/user-stories.md)
* [Presentation Deck](https://docs.google.com/presentation/d/16LfaV3khdRkDPQhJcH_3SRNl2cNkrvGCUulXRpk7bY4/edit?usp=sharing)

