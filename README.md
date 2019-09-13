PHP Composer for Decode Projects
===

This is an extension of PHP composer with some needed modifications to run
Drush commands successfully.

## Modifications
The *mysql-client* package is installed per Drush requirement.

### PATH Modification
```bash
PATH="/app/vendor/bin:${PATH}"
```

### Included PHP Extensions
* GD
* Zip
* Intl
* PDO_mysql

## How to use
Check back later.
