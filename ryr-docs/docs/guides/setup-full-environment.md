# How to setup a full environment?

## Accounts

First, you will need:

* A [Yelp](https://www.yelp.com/signup) account
* A [Google](https://accounts.google.com/SignUp) account

## Developer keys

Create a developer Key for:

* [Yelp Fusion API](https://www.yelp.com/developers/v3/manage_app)
* [Google Places API](https://developers.google.com/places/web-service)
* [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/get-api-key)

## Environment variables

Once your accounts are setup, store your developer keys in a global environment file. This file should be located in `~/.config/ryr`, which is your configuration directory for the request-yo-racks project.
``` bash
RYR_GLOBAL_CONFIG_DIR="${HOME}/.config/ryr"
mkdir -p "${RYR_GLOBAL_CONFIG_DIR}"
cat << EOF > "${RYR_GLOBAL_CONFIG_DIR}/ryr-env.sh"
export RYR_COLLECTOR_YELP_CLIENT_ID=<redacted>
export RYR_COLLECTOR_YELP_CLIENT_SECRET=<redacted>
export RYR_COLLECTOR_GOOGLE_PLACES_API_KEY=<redacted>
export RYR_COLLECTOR_GOOGLE_GEOCODING_API_KEY=<redacted>
EOF
chmod 400 "${RYR_GLOBAL_CONFIG_DIR}/ryr-env.sh"
```

For creating Kubernetes secrets, you need to create one file per key in the
`~/.config/ryr/kubernetes-secrets` folder:

```bash
mkdir -p "${RYR_GLOBAL_CONFIG_DIR}/kubernetes-secrets"
cd "${RYR_GLOBAL_CONFIG_DIR}/kubernetes-secrets"
echo "<redacted>" > RYR_COLLECTOR_YELP_CLIENT_ID
echo "<redacted>" > RYR_COLLECTOR_YELP_CLIENT_SECRET
echo "<redacted>" > RYR_COLLECTOR_GOOGLE_PLACES_API_KEY
echo "<redacted>" > RYR_COLLECTOR_GOOGLE_GEOCODING_API_KEY
```

At the end of the process, your `~/.config/ryr` folder should look like this:
```bash
[~/.config/ryr] $ tree -L 2
.
├── kubernetes-secrets
│   ├── RYR_COLLECTOR_GOOGLE_GEOCODING_API_KEY
│   ├── RYR_COLLECTOR_GOOGLE_PLACES_API_KEY
│   ├── RYR_COLLECTOR_YELP_CLIENT_ID
│   ├── RYR_COLLECTOR_YELP_CLIENT_SECRET
│   └── RYR_WEB_GOOGLE_MAPS_API_KEY
└── ryr-env.sh
```

## Clone the projects

!!! warning
    Minikube is using shared folders between the host and virtualbox and expects to find the source code of the projects in a sub-directory of the home folder of your user.

Create a folder which will contain the RYR projects (the `charts` and `docs` projects are optional as
they are no required to run the projects.):
``` bash
RYR_PROJECT_DIR="${HOME}/projects/request-yo-racks"
mkdir -p "${RYR_PROJECT_DIR}"
cd "${RYR_PROJECT_DIR}"
for project in api infra web; do
  git clone git@github.com:request-yo-racks/${project}.git
done
```

Each project is provided with a `Makefile` and can be simply setup with the `make` command.

## Start the services

### External services

```bash
cd "${RYR_PROJECT_DIR}/infra/kubernetes"
make provision
eval $(minikube docker-env)
make configure
```

### API

```bash
eval $(minikube docker-env)
cd "${RYR_PROJECT_DIR}/api"
make setup deploy-minikube
```

Test your setup:
```bash
curl -i http://api.192.168.99.100.nip.io/places/
```

### Web

```bash
eval $(minikube docker-env)
cd "${RYR_PROJECT_DIR}/web"
make setup deploy-minikube
```

Check the web application:
```bash
open http://www.192.168.99.100.nip.io/
```
