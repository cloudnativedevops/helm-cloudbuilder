# cz-helm

[Helm](https://helm.sh/) is used for deploying apps to Kubernetes.

This repo automates building a private helm Docker image that we can use with [Google Container Builder](https://cloud.google.com/container-builder/docs/) as a build step for our deployments.

# Updating Helm
Use git tags in this repo to track the release version of [Helm Releases](https://github.com/kubernetes/helm/releases). Anytime a new release tag is pushed to this repo a new image of helm will be automatically built and pushed to our GKE clusters by a trigger defined in the [cloudbuild.yaml](cloudbuild.yaml) file. The tags on this repo should match the version of the helm release that we are using.
