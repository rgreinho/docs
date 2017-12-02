# Request-Yo-Racks docs

The documentation site for the Request-Yo-Racks projects.

The [Request-Yo-Racks Documentation Site](https://request-yo-racks.github.io/docs/) is automatically updated when a commit gets merged into the `master` branch.

## Set it up

One single command to setup the full environment:
```
make
```

## Build the documentation site

```
make build
```

This will create a new directory, named site.

## Serve the documentation site

Serve the documentation using the development server:
```
make serve
```

Then browse to the URL: <http://127.0.0.1:8000>.

## Add some documentation

Create a new directory or use an existing one to put an `.md` file into it.

Modify the `pages` section of the  `mkdocs.yml` file to reflect your changes.
