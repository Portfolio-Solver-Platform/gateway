# Gateway

This is the gateway for PSP.

## Usage

First time setup: Run `bootstrap.sh`. This installs some required Kubernetes Custom Resource Definitions (CRDs).

Run `skaffold dev` to launch the gateway in development mode.
For production, use `skaffold run -p prod`.

For minikube, get the IP of the gateway by executing `minikube/access.sh`.
This starts a `minikube tunnel` (if it's not already started) and then retrieves the IP of the gateway.

> [!WARNING]
> It's important not to use `minikube service` or similar commands that require you to access the gateway with a non-standard port (i.e., not 80 or 443) because it breaks [Keycloak](https://github.com/Portfolio-Solver-Platform/keycloak).

> [!NOTE]
> The `gateway-nginx` deployment in the `default` namespace can __not__ be uninstalled with `helm` or `skaffold` again once the gateway has been launched. You instead need to manually remove it if you wish to purge the gateway from your Kubernetes cluster. This is because the gateway fabric spawns it, meaning that the automated tooling doesn't know it has been spawned.
