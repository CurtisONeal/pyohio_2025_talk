https://n8n.io/
https://docs.n8n.io/
## Starting n8n[#](https://docs.n8n.io/hosting/installation/docker/#starting-n8n "Permanent link")

From your terminal, run:

|             |                                                                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------- |
| 1<br>2<br>3 | `docker volume create n8n_data  docker run -it --rm --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n` |

This command will download all required n8n images and start your container, exposed on port `5678`. To save your work between container restarts, it also mounts a docker volume, `n8n_data`  to persist your data locally.

You can then access n8n by opening: [http://localhost:5678](http://localhost:5678/)


By default n8n uses SQLite to save credentials, past executions and workflows. n8n also supports PostgresDB configurable using environment variables as detailed below.

It's important to still persist data in the `/home/node/.n8n` folder as it contains n8n user data and even more importantly the encryption key for credentials. It's also the name of the webhook when the n8n tunnel is used.

If no directory is found, n8n creates automatically one on startup. In this case, existing credentials saved with a different encryption key can not be used anymore.

## Setting timezone[#](https://docs.n8n.io/hosting/installation/docker/#setting-timezone "Permanent link")

To define the timezone n8n should use, the environment variable `GENERIC_TIMEZONE` can be set. This gets used by schedule based nodes such as the Cron node.

The timezone of the system can also be set separately. This controls what some scripts and commands return like `$ date`. The system timezone can be set using the environment variable `TZ`.

Example using the same timezone for both:

|                                           |                                                                                                                                                                                                              |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1<br>2<br>3<br>4<br>5<br>6<br>7<br>8<br>9 | `docker volume create n8n_data  docker run -it --rm \  --name n8n \  -p 5678:5678 \  -e GENERIC_TIMEZONE="Europe/Berlin" \  -e TZ="Europe/Berlin" \  -v n8n_data:/home/node/.n8n \  docker.n8n.io/n8nio/n8n` |
You can also use the command line to pull the latest, or a specific version:

|                                      |                                                                                                                                                                                                                    |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1<br>2<br>3<br>4<br>5<br>6<br>7<br>8 | `# Pull latest (stable) version docker pull docker.n8n.io/n8nio/n8n  # Pull specific version docker pull docker.n8n.io/n8nio/n8n:0.220.1  # Pull next (unstable) version docker pull docker.n8n.io/n8nio/n8n:next` |

Stop the container and start it again. You can also use the command line:

|   |   |
|---|---|
|1<br> 2<br> 3<br> 4<br> 5<br> 6<br> 7<br> 8<br> 9<br>10<br>11|`# Get the container ID docker ps -a  # Stop the container with ID container_id docker stop [container_id]  # Remove the container with ID container_id docker rm [container_id]  # Start the container docker run --name=[container_name] [options] -d docker.n8n.io/n8nio/n8n`|

### Docker Compose[#](https://docs.n8n.io/hosting/installation/docker/#docker-compose "Permanent link")

If you run n8n using a Docker Compose file, follow these steps to update n8n:

|                                      |                                                                                                                                              |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| 1<br>2<br>3<br>4<br>5<br>6<br>7<br>8 | `# Pull latest version docker compose pull  # Stop and remove older version docker compose down  # Start the container docker compose up -d` |

==Danger==

==Use this for local development and testing. It isn't safe to use it in production==

To be able to use webhooks for trigger nodes of external services like GitHub, n8n has to be reachable from the web. n8n has a [tunnel service](https://github.com/localtunnel/localtunnel) which redirects requests from n8n's servers to your local n8n instance.

Start n8n with `--tunnel` by running:

|                                      |                                                                                                                                                                |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1<br>2<br>3<br>4<br>5<br>6<br>7<br>8 | `docker volume create n8n_data  docker run -it --rm \  --name n8n \  -p 5678:5678 \  -v n8n_data:/home/node/.n8n \  docker.n8n.io/n8nio/n8n \  start --tunnel` |
