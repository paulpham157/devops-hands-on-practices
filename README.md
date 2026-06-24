# docker-course

## Course Sections

- `lab-setup`: Vagrant VM used as a clean Docker lab machine.
- `images`: first Docker image examples.
- `docker-image-examples`: Dockerfiles for Nginx, Flask, Node.js, Prometheus, Grafana, and non-root containers.
- `docker-init`: minimal Flask app for first containerization practice.
- `multi-stage-builds`: single-stage, multi-stage, and distroless Node.js image examples.
- `optimize-docker-images`: layer count and cache optimization examples.
- `hands-on-practice`: follow-up hands-on labs for Compose, Kubernetes, K3s, OpenShift, GKE, EKS, AKS, ECS, Fargate, service mesh with Istio, Linkerd, and Consul, data management patterns for distributed cloud systems, data pipeline design and operation, availability patterns for distributed systems, design and implementation patterns such as Strangler Fig, Sidecar, and Anti-Corruption Layer, network patterns such as Ambassador, Gateway Routing, Gatekeeper, Valet Key, and Static Content Hosting, backend patterns such as Backend for Frontend, SLI/SLO/SLA and error budget practices, Snyk and Sonar for security and quality gates, Ansible, Packer, Terraform, OpenTofu, AWS CDK, CloudFormation, Pulumi, Terraform extension patterns, observability with Prometheus/Grafana/Loki, Jenkins CI, GitHub Actions, GitLab CI, DevSecOps, Argo CD GitOps, secrets management, AWS identity, Helm, Kustomize, artifact repositories, JFrog Artifactory, OpenTelemetry, Jaeger, Datadog, language runtime containerization with Python, Java Spring, Ruby, Go, and Rust, Linux/Unix fundamentals, Redis caching, load balancing, application protocols for microservices, AWS/Azure/GCP cloud fundamentals, and serverless functions platforms.

Start the follow-up practice track here:

```bash
cd hands-on-practice
```

## Install Latest VirtualBox
> Note: You should have admin permission in your workstation to make Virtaualbox work.

Download and install virtual box from https://www.virtualbox.org/wiki/Downloads

## Install Vagrant

Install Vagrant followin insructions from https://developer.hashicorp.com/vagrant/downloads

## Restart the System

Once all the installation is done, restart the system.

## Bring up the VM

Clone the docker course repo.

```
git clone https://github.com/techiescamp/docker-course.git
```

Now, open the terminal and cd in the docker-course/lab-setup.

```
cd docker-course/lab-setup
```

Execute the following command to bring up the VMs

```
vagrant up
```
Check the vm status using the following command. You should see  VM in running state.

```
vagrant status
```

Once the VMs are up, you cna login to the VM using the VM name.

```
vagrant ssh Docker 
```

## Halt the VMs

When you are not using the setup, you can halt the VMS to free up the CPU and memory in your system using the halt command.

```
vagrant halt
```

## Destroy the setup

You can destroy the VMs usin the following command.

```
vagrant destroy -f
```
