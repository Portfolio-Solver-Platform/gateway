# Gateway

This is the gateway for PSP.

## First Time Setup

Run `bootstrap.sh`. This installs some required Kubernetes Custom Resource Definitions (CRDs).

## Usage

In development, you need to launch the gateway using `skaffold dev` and run `minikube tunnel`.
Then, run `minikube/access.sh` and follow the instructions it gives you.

For production, use `skaffold run -p prod`.

### Routes 

The following are the current routes/subdomains on the gateway:
- `metrics.local` to [Grafana](https://github.com/Portfolio-Solver-Platform/monitoring)
- `keycloak.local` to [Keycloak](https://github.com/Portfolio-Solver-Platform/keycloak)
- `/api/solverdirector` to [Solver Director](https://github.com/Portfolio-Solver-Platform/solver-director)
- `/api/user` to [the user service](https://github.com/Portfolio-Solver-Platform/user)

To add more, you need to add a route in the `/charts/routes` chart.
