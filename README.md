## Prerequisite:
- Helm Client.
- Kubeconfig generated for the cluster you want to deploy to (I am using single node kubernetes cluster available via docker desktop).
- This [repo](https://github.com/gulsheensingh93/homework) cloned locally. 

The repository already comes setup with github runners for running your workflows.

Setup Process:

Image build:
The image build and publish process is automated using the github actions. You can either:
- Do changes in your feature branch and get it merged to main branch to trigger a new build and publish for your application.
- Manually run the build-publish workflow.

The image tag is controlled by the VERSION file in the repo and thus can be updated as the new changes come.

To deploy the application, simply run the below command:
"helm upgrade --install <RELEASE_NAME> -f <PATH_TO_REPO>/homework/values.yaml <PATH_TO_REPO>/homework -n <NAMESPACE> --create-namespace"

The create namespace flag makes sure if the namespace doesn't exists, it creates before deploying the release. We can also have the atomic flag to uninstall and revert to old release, but as this is dev envrionment we would like to keep the failed release from debugging point of view.