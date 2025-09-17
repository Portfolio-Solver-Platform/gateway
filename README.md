# Gateway

This is the gateway for PSP.

## First Time Setup

Run `bootstrap.sh`. This installs some required Kubernetes Custom Resource Definitions (CRDs).

Additionally, you need to launch the gateway using `skaffold dev`. Then, insert the following in your `/etc/hosts` file:
```
<IP> local harbor.local keycloak.local grafana.local prometheus.local
```
where `<IP>` is the IP that the `minikube/access.sh` script tells you after you execute it.

## Usage

Run `skaffold dev` to launch the gateway in development mode.
For production, use `skaffold run -p prod`.

> [!NOTE]
> The `gateway-nginx` deployment in the `default` namespace can __not__ be uninstalled with `helm` or `skaffold` again once the gateway has been launched. You instead need to manually remove it if you wish to purge the gateway from your Kubernetes cluster. This is because the gateway fabric spawns it, meaning that the automated tooling doesn't know it has been spawned.

### Routes 

The following are the current routes/subdomains on the gateway (note that the written routes are accessed by `local/<path>`):
- `grafana.local` to [Grafana](https://github.com/Portfolio-Solver-Platform/monitoring)
- `keycloak.local` to [Keycloak](https://github.com/Portfolio-Solver-Platform/keycloak)
- `/api/solverdirector` to [Solver Director](https://github.com/Portfolio-Solver-Platform/solver-director)

To add more, you need to add a route in the `/charts/routes` chart.
