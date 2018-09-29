# Services and costs

Here is a breakdown of the services and costs associated to running the Request Yo Racks services.

## Deployed services

### Infrastructure support

*   [Ingress Controller](https://cloud.google.com/community/tutorials/nginx-ingress-gke): L7 Load balancer
*   [External DNS Manager](https://github.com/kubernetes-incubator/external-dns): Hosted DNS zone automated management
*   [CertManager](https://github.com/jetstack/cert-manager): SSL Certificate management
*   [Stackdriver](https://cloud.google.com/stackdriver/): Logging

### Project support

*   [Redis](https://redis.io/): Caching and broker for distributed tasks
*   [Postgres](https://www.postgresql.org/): SQL Database

### RYR projects

These projects are for RYR itself, the frontend, the API and the backend.

*   RYR API
*   RYR Celery Workers (x2)
*   RYR Celery Flower
*   RYR Web

#### RYR sites

Site | URL
---| ---
Docs | [docs.requestyoracks.org](https://docs.requestyoracks.org)
Charts | [charts.requestyoracks.org](https://charts.requestyoracks.org)
Landing page | [landing.requestyoracks.org](https://landing.requestyoracks.org) (but currently [www.requestyoracks.org](https://www.requestyoracks.org))
www | [www.requestyoracks.org](https://www.requestyoracks.org) (*currently unavailable*)
API | [api.requestyoracks.org](https://api.requestyoracks.org) (*currently unavailable*)


## External Services

The Request Yo Racks infrastructure uses the free or Open Source tier for all the following services.

*   [Github](https://github.com) (with Github pages): Code repositories and static site hosting
*   [Circle CI](https://circleci.com/): Continuous Integration
*   [Mergify.io](https://mergify.io/): Automatically merge approved Pull Requests
*   [Coveralls.io](https://coveralls.io/): Ensure new code contributions come with unit tests
*   [Gitmate.io](https://gitmate.io/): Automate some basic administration tasks
*   [Docker Hub](https://hub.docker.com/): Registry and pipeline for Docker images
*   [Let’s Encrypt](https://letsencrypt.org/): Free, automated, and open Certificate Authority

## Costs

Provider      | Service                          | Cost
--------------|:---------------------------------|----:
GCP           | Kubernetes HA cluster 3 Nodes N1 | $110.00
GCP           | Load Balancer                    | $18.00
GCP           | Storage (100GB)                  | $10.00
GCP           | Misc fees                        | $5.00
Google domain | Domain name (yearly: $30)        | $2.50
              |                        **TOTAL** | **$145.50**
