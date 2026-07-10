# Explainer: Connect Frontend and Backend

The connection generator represents a contract between projects.

The frontend should not hardcode backend endpoints by hand when the workspace has a generated connection mechanism. The connection should help the source project discover or call the target project through generated code, configuration, or infrastructure references.

Review the connection because it affects local development, deployed endpoints, authentication, and environment-specific values.
