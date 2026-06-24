# Pulumi Example

Pulumi lets you define infrastructure with general-purpose programming languages. The program is evaluated by the Pulumi engine, compared against Pulumi state, and then applied through providers.

## Read First

- `Pulumi.yaml` names the project and runtime.
- `index.ts` declares a versioned, encrypted S3 bucket with public access blocked.
- In a real environment, `pulumi preview` shows proposed changes before `pulumi up`.

## Review Habit

Because Pulumi uses normal programming languages, review both infrastructure intent and code behavior. Avoid hidden side effects in helper functions.

