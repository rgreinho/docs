# How to setup a full environment?

First, you will need a [Yelp](https://www.yelp.com/signup) and [Google](https://accounts.google.com/SignUp) account, as well as developer keys for some of their services.

Create a developer Key for:

* [Yelp Fusion API](https://www.yelp.com/developers/v3/manage_app)
* [Google Places API](https://developers.google.com/places/web-service)
* [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/get-api-key)


Once your accounts are setup, store your developer keys in a global environment file:
```
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

Then create a folder which will contain the RYR projects:
```
RYR_PROJECT_DIR="${HOME}/projects/request-yo-racks"
mkdir -p "${RYR_PROJECT_DIR}"
cd "${RYR_PROJECT_DIR}"
git clone git@github.com:request-yo-racks/api.git
git clone git@github.com:request-yo-racks/docs.git
git clone git@github.com:request-yo-racks/infra.git
git clone git@github.com:request-yo-racks/web.git
```

Each project can be simply setup with the `make` command, and a local developer environment is provided via `docker-compose`.

You can start the API service and the frontend like this:
```
source "${RYR_GLOBAL_CONFIG_DIR}/ryr-env.sh"
cd "${RYR_PROJECT_DIR}/api"
make
docker-compose up -d
cd "${RYR_PROJECT_DIR}/web"
make
docker-compose up -d
```

All the services are running in the background.

Now open Chrome and go to http://localhost:38888.
