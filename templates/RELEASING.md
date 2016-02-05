# Releasing

Check the version number on `config/initializers/version.rb` then start the release for the next version.
Remember to follow [semantic versioning](config/initializers/version.rb).

```sh
$ git flow release start <version>
```

Update `config/initializers/version.rb` with the new version number and commit your changes.

```sh
$ git commit -am "Bump version to <version>"
$ git flow release finish <version>
```

Indicate changes when prompted and then push to remotes

```sh
$ git push origin master
$ git push origin develop
$ git push --tags
```
