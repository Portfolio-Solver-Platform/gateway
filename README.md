# Gateway

This is the gateway for PSP.

## First Time Setup

Run `bootstrap.sh`. This installs some required Kubernetes Custom Resource Definitions (CRDs).

Additionally, you need to launch the gateway using `skaffold dev` and run `minikube tunnel`. Then, insert the following in your `/etc/hosts` file:
```
<IP> local keycloak.local metrics.local secrets.local 
```
where `<IP>` is the IP that the `minikube/access.sh` script tells you after you execute it.

## Usage

Run `skaffold dev` to launch the gateway in development mode.
For production, use `skaffold run -p prod`.

### Routes 

The following are the current routes/subdomains on the gateway:
- `metrics.local` to [Grafana](https://github.com/Portfolio-Solver-Platform/monitoring)
- `keycloak.local` to [Keycloak](https://github.com/Portfolio-Solver-Platform/keycloak)
- `/api/solverdirector` to [Solver Director](https://github.com/Portfolio-Solver-Platform/solver-director)
- `/api/user` to [the user service](https://github.com/Portfolio-Solver-Platform/user)

To add more, you need to add a route in the `/charts/routes` chart.
