# Azure Container Demos

# Prerequisites
Install Docker:
   * http://get.docker.io

Install the `az` Azure cli:
   * https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

Install Kubectl
   * `az acs kubernetes install-cli`

Install some packages:
   * `apt-get install python-pip tmux pv jq`
   * `pip install yq`

Install some binaries:
   * Helm - http://helm.sh
   * Kubeless - https://github.com/kubeless/kubeless

# Setup
   * Create a Kubernetes cluster
   * If you want to run the `kube-lego` demo you need to run the `setup.sh` script in that directory.

# Verify
Run `./verify.sh` to verify your environment looks ok.

# Running
For a particular demo:
  * `cd ${demo-dir}`
  * `./demo.sh`

For the most part the demos clean up after themselves, but you may want to delete any stray namespaces you see at the end.
