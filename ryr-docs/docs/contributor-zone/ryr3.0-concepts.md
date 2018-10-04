# Request Yo Racks 3.0 Concepts

RYR 3.0 is a **MAJOR** rewrite of the project. And RYR being a collection of projects, changes will happen in most of them.

![RYR Family](img/ryr-family.png "ryr family")

The reasons for such a rewrite are mainly:

* Leveraging what we learned and apply it to produce higher quality deliverables
* Using technologies with a higher adoption rate in order to:
    * Benefit from a more modern tooling
    * Gain more contributors

Working with [Polymer] was cool, but it was very hard to find people interested in helping. Switching to [ReactJS] gave us the opportunity to attract more contributors very quickly. It also made it way quicker/easier to find documentation, examples and tools.

## Main projects

### Frontend

As mentioned previously, we are switching from [Polymer] to [ReactJS]. This is the biggest task!

In addition to this we want our components to be documented and tested. We want to be able to use them individually
easily and provide demos (as a form a test and documentation).

We plan on using [Ant](https://ant.design/) and [Ant Mobile](https://mobile.ant.design/) for the UI component libraries.

List of [Issues](https://github.com/request-yo-racks/web/issues).

### Backend

The backend is currently operational, distributed, elastic and well tested. But we want to go even further.

Here is what we want to implement in the next version:

* Use OpenAPI to define the REST API
    * Describe the API using an OpenAPI document
    * Generate the REST API server
* Add extra collectors
* Improve the validity of the data being collected
* Send emails automatically

List of [Issues](https://github.com/request-yo-racks/api/issues).

### Documentation

Documentation is a key principle of this RYR. There is always something to write about or some room for improvement.

We have very good overview documentation, a great setup guide, but each of our project should have individual
documentation providing the following:

* A README file containing:
    * General information about the project
    * A quick start guide to set it up
    * A quick start guide for contributors
* A Changelog following the [keep a changelog](https://keepachangelog.com/en/1.0.0/) recommendations
* A static documentation web site:
    * Explaining in great details how to use this specific project
    * Explaining in great details how to contribute to this specific project
    * Updated with each merge to the master branch
    * Hosted on GitHub page

### Infrastructure

The Infrastructure is in a fairly good shape, but we are always looking for more automation
or ways to improve our workflows.

#### Probot for Issue/Pull-Request management

[Probot](https://probot.github.io/) is a set of apps to automate and improve your GitHub workflows. We should use some of them to manage our projects more efficiently.

Here are a few apps we identified:

* [Commit Lint](https://probot.github.io/apps/commitlint/)
* [Move Issues](https://probot.github.io/apps/move/)
* [Stale](https://probot.github.io/apps/stale/)

We are also using [Gitmate for sizing PRs](https://gitlab.com/gitmate/open-source/gitmate-2/tree/master/plugins/gitmate_pr_size_labeller). We should write a Probot app to replace it.

List of [Issues](https://github.com/request-yo-racks/infra/issues).

### Artwork / Branding / Marketing

The project needs a stronger identity.

We have cool logos, a nice design, but we have nothing defining the "brand" of our project.

Ideally each of our project/subproject should have its own identity, while preserving the feeling of being a piece of the RYR ecosystem.

#### Artwork

As we are starting to create cool pieces artworks, they probably deserve their own project.

#### Newsletter

A newsletter is a great channel to provide information to your users. We have a few ideas to execute this task:

* **Write our own:** it shounds appealing, but we would need to be sure to be able to create enough content.
* **Use other's newsletter:** for example post an article in Bike Austin, Open Austin, etc.
* **Compile related information from other sources:** This may also be automated.

#### Social media

We do not have any presence on social media yet. We should probably have at least a Facebook page, and twitter account.

## Side projects

### Landing page

The current landing page was a very small and simple project we used to learn [Polymer] 3.0. Converting it to [ReactJS]
would be a good way to become more familiar with the framework.

List of [Issues](https://github.com/request-yo-racks/landing-page/issues).

### Chart repository index page

Our [Helm Chart index page](https://charts.requestyoracks.org) is a very simple static page built by parsing our
[chart repository index file](https://github.com/request-yo-racks/charts/blob/gh-pages/index.yaml)
([official documentation](https://github.com/helm/helm/blob/master/docs/chart_repository.md#the-index-file)).

Ideally we would suppress the static generation step by developing an application which would generate the page on the
fly. Something similar to what [Docsify] does, but for the chart index instead.

### Flower Docker image

There is currently no official upstream [flower] image for Docker. Ours is similar to the
[images that can be found](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=celery+flower&starCount=0)
on the Docker hub, but has the advantages of being current and very small (47MB - 3x to 6x smaller than other ones).

We should polish it and position it as the default image for Flower, and ideally it would become the official upstream
image.

List of [Issues](https://github.com/request-yo-racks/docker-celery-flower/issues).

### Flower Helm Chart

Having a good Docker Image is one thing, but being able to deploy it easily and quickly is another one.

Our chart works fine to deploy [Flower] in our development environment but is not production ready. We should push it
to the next level and like the Docker image, position it as the official chart, submit it upstream, as well as to the
[official Charts for Helm](https://github.com/helm/charts).

List of [Issues](https://github.com/request-yo-racks/charts/issues).

### Living style guide

We need a style guide to ensure consistency in our projects and simplify the development process.

[react-styleguidist](https://react-styleguidist.js.org/) seems to be a great candidate, but there is definitely more
research to do.

## 3rd party projects we use that could receive some love

We are using a wide variety of open source tools to build RYR. It would be nice to allocate some cycles to contribute
back.

### Python - [Flower]

### Python - [Responses]



[Docsify]: (https://docsify.js.org)
[Flower]: (https://github.com/mher/flower)
[Polymer]: (https://www.polymer-project.org/3.0/start)
[ReactJS]: (https://reactjs.org)
[Responses]: (https://github.com/getsentry/responses)
