# How to setup a full environment?

## Prerequisites

!!! tips
    A script in the
    [infra](https://github.com/request-yo-racks/infra/tree/master/bootstrap)
    repository can assist you to install the prerequisites software automatically and configure your Github account
    (**OS X only**).

    To start the procedure, simply run the following command:
    ```bash
    bash <(curl -fsSL https://raw.githubusercontent.com/request-yo-racks/infra/master/bootstrap/bootstrap-osx.sh)
    ```

    At the end of the procedure, your SSH key will be automatically copied to your clipboard and
    a web page will pop up with the instructions to help you add it to Github.

    If nothing pops up, run `export BS_SILENT=0`, then replay the script.


### Github

* A [Github](github.com) account
    * With an [SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
    * Added to your [Github account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

### Software

* [Homebrew](https://brew.sh/) if you are using OSX
* A terminal. The default one is fine, but [iterm2](https://iterm2.com/) is better
* [Virtualbox](https://www.virtualbox.org/)
* [Docker](https://docs.docker.com/docker-for-mac/install/)
* [NodeJS](https://nodejs.org/en/)

### Accounts

First, you will need:

* A [Yelp](https://www.yelp.com/signup) account
* A [Google](https://accounts.google.com/SignUp) account

### Developer keys

Create a developer Key for:

* [Yelp Fusion API](https://www.yelp.com/developers/v3/manage_app)
* [Google Places API](https://developers.google.com/places/web-service)
* [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/get-api-key)
* [Google Maps JavaScript API](https://developers.google.com/maps/documentation/javascript/get-api-key)

## Environment variables

!!! tips
    Add the RYR variables to your `~/.bash_profile` to avoid exporting them every time:
    ```bash
    # Set RYR variables.
    export RYR_GLOBAL_CONFIG_DIR="${HOME}/.config/ryr"
    export RYR_PROJECT_DIR="${HOME}/projects/request-yo-racks"
    ```

Once your accounts are setup, store your developer keys in a global environment file. This file should be located in
`~/.config/ryr`, which is your configuration directory for the request-yo-racks project.

Export the location of the configuration directory to an environment variable:
```bash
export RYR_GLOBAL_CONFIG_DIR="${HOME}/.config/ryr"
```

Then create the `ryr-env.sh` script:
``` bash
mkdir -p "${RYR_GLOBAL_CONFIG_DIR}"
cat << EOF > "${RYR_GLOBAL_CONFIG_DIR}/ryr-env.sh"
export RYR_COLLECTOR_YELP_CLIENT_ID=foo
export RYR_COLLECTOR_YELP_CLIENT_SECRET=foo
export RYR_COLLECTOR_GOOGLE_PLACES_API_KEY=foo
export RYR_COLLECTOR_GOOGLE_GEOCODING_API_KEY=foo
export RYR_WEB_GOOGLE_MAPS_API_KEY=foo
export API_BASE_URL=http://api.192.168.99.100.nip.io/
EOF
chmod 400 "${RYR_GLOBAL_CONFIG_DIR}/ryr-env.sh"
```

For creating Kubernetes secrets, you need to create one file per key in the
`~/.config/ryr/kubernetes-secrets` folder:

```bash
mkdir -p "${RYR_GLOBAL_CONFIG_DIR}/kubernetes-secrets"
cd "${RYR_GLOBAL_CONFIG_DIR}/kubernetes-secrets"
echo "foo" > RYR_COLLECTOR_YELP_CLIENT_ID
echo "foo" > RYR_COLLECTOR_YELP_CLIENT_SECRET
echo "foo" > RYR_COLLECTOR_GOOGLE_PLACES_API_KEY
echo "foo" > RYR_COLLECTOR_GOOGLE_GEOCODING_API_KEY
echo "foo" > RYR_WEB_GOOGLE_MAPS_API_KEY
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

## Fork the projects

Go to the [Request Yo Racks](https://github.com/request-yo-racks) organization on Github and
[fork](https://help.github.com/articles/fork-a-repo/) the `infra`, `api`, and `web` projects (the `charts` and `docs` projects are optional as they are no required to run RYR).

## Clone the projects

Configure a folder which will contain the RYR projects:
```bash
export RYR_PROJECT_DIR="${HOME}/projects/request-yo-racks"
```

Configure your Github user:
```bash
export GH_USER=<your_github_user_name>
```

Clone the projects (the `charts` and `docs` projects are optional as they are no required to run RYR):
``` bash
mkdir -p "${RYR_PROJECT_DIR}"
cd "${RYR_PROJECT_DIR}"
for project in api infra web; do
  git clone git@github.com:${GH_USER}/${project}.git
done
```

Each project is provided with a `Makefile` and can be simply setup with the `make` command.

## Start the services

### External services

This will spin up `minikube` and setup the external services that are required by RYR, like `postgresql`, `redis`,
`rabbitmq`.

```bash
cd "${RYR_PROJECT_DIR}/infra/kubernetes"
make provision configure
```

### API

```bash
eval $(minikube docker-env)
cd "${RYR_PROJECT_DIR}/api"
make build-docker deploy-minikube
```

Test your setup from a terminal:
```bash
curl -i http://api.192.168.99.100.nip.io/places/30.318673580117846,-97.72446155548096
```
Or browse it:
```bash
open http://api.192.168.99.100.nip.io/places/30.318673580117846,-97.72446155548096
```

### Web

!!! notes
    Your Google Maps API key will automatically be pulled from the environment variables into the `src/config-dev.js`
    file by the `Makefile`. See the `init-config` target for more details.

```bash
eval $(minikube docker-env)
cd "${RYR_PROJECT_DIR}/web"
SUFFIX=.dev make build-docker deploy-minikube
```

Check the web application:
```bash
open http://www.192.168.99.100.nip.io/
```
