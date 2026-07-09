# Explainer: Separate Local Dev from Cloud Deploy

Local development proves that generated projects can run and talk to each other on a workstation.

Cloud deployment proves something different: IAM, auth domains, API exposure, infrastructure state, account settings, and resource naming must all work in AWS.

Do not treat a working local dev server as proof that the generated infrastructure is production-ready.
