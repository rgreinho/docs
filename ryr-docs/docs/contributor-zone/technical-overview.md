# Technical overview

Request Yo Racks is a collection of open source projects hosted on Github.

## Key principles

* Everything must be automated.
* Everything must be documented.
* Everything must be containerized.

## API

The API is done in [Python](https://www.python.org/). We currently use [Django REST Framework](http://www.django-rest-framework.org/) (DRF), but will possibly switch to [APIStar](https://github.com/encode/apistar) in a near future.

The tasks will be handled by [Celery](http://docs.celeryproject.org/en/latest/index.html) to process them asynchronously.

ALL the documentation is written in [reStructuredText](ttp://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html) and generated with [Sphinx](http://www.sphinx-doc.org/en/stable/)

Repository: [API](https://github.com/request-yo-racks/api)

## Web

The frontend is a [Progressive Web Application (PWA)](https://developers.google.com/web/progressive-web-apps/). The [Polymer](https://www.polymer-project.org/) library offers the ability to quickly create a PWA implementing the [PRPL pattern](https://developers.google.com/web/fundamentals/performance/prpl-pattern/), and to build[ web components](https://www.webcomponents.org/).

Repository: [Web](https://github.com/request-yo-racks/web)

## Infrastructure

The projects are fully containerized using [Docker](https://docs.docker.com/engine/understanding-docker/) and will be deployed on a [Kubernetes](https://kubernetes.io/) cluster, most likely on the [GCP](https://cloud.google.com/).
