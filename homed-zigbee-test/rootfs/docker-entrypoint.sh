#!/usr/bin/env bashio

bashio::log.info "Preparing to start..."

bashio::config.require 'data_path'

export HOMED_DATA="$(bashio::config 'data_path')"
if ! bashio::fs.file_exists "$HOMED_DATA/configuration.yaml"; then
    mkdir -p "$HOMED_DATA" || bashio::exit.nok "Could not create $HOMED_DATA"

    cat <<EOF > "$HOMED_DATA/configuration.yaml"
homeassistant: true
EOF
fi

export HOMED_CONFIG_FRONTEND='{"port": 8080}'

# Expose addon configuration through environment variables.
function export_config() {
    local key=${1}
    local subkey

    if bashio::config.is_empty "${key}"; then
        return
    fi

    for subkey in $(bashio::jq "$(bashio::config "${key}")" 'keys[]'); do
        export "HOMED_CONFIG_$(bashio::string.upper "${key}")_$(bashio::string.upper "${subkey}")=$(bashio::config "${key}.${subkey}")"
    done
}

bashio::log.info "Starting HOMED-Zigbee..."

