import jetbrains.buildServer.configs.kotlin.BuildType
import jetbrains.buildServer.configs.kotlin.Project
import jetbrains.buildServer.configs.kotlin.buildSteps.script
import jetbrains.buildServer.configs.kotlin.triggers.vcs
import jetbrains.buildServer.configs.kotlin.projectFeatures.dockerRegistry
import jetbrains.buildServer.configs.kotlin.vcs.GitVcsRoot

version = "2026.1"

project {
    vcsRoot(AppRepo)
    buildType(BuildAndTest)
    buildType(ContainerPackage)

    features {
        dockerRegistry {
            id = "dockerhub"
            name = "Docker Hub"
        }
    }
}

object AppRepo : GitVcsRoot({
    name = "sample-app"
    url = "https://example.invalid/platform/sample-app.git"
    branch = "refs/heads/main"
})

object BuildAndTest : BuildType({
    name = "Build and Test"
    artifactRules = "reports/build-metadata.txt"
    params {
        param("env.BRANCH_CHANNEL", "mainline")
    }
    vcs {
        root(AppRepo)
        branchFilter = """
            +:refs/heads/main
            +:refs/heads/release-*
            +:refs/heads/feature-*
        """.trimIndent()
    }
    triggers {
        vcs {
            branchFilter = """
                +:refs/heads/main
                +:refs/heads/feature-*
            """.trimIndent()
        }
    }
    steps {
        script {
            name = "Unit tests"
            scriptContent = """
                mkdir -p reports
                echo "branch=%teamcity.build.branch%" > reports/build-metadata.txt
                ./scripts/test.sh
            """.trimIndent()
        }
    }
})

object ContainerPackage : BuildType({
    name = "Container Package"
    artifactRules = "artifacts/image-digest.txt"
    params {
        password("secure:docker.password", "credentialsJSON:*****")
    }
    vcs {
        root(AppRepo)
    }
    steps {
        script {
            name = "Docker build"
            scriptContent = """
                mkdir -p artifacts
                ./scripts/build-image.sh
                echo "image=docker-course/sample-app:%build.number%" > artifacts/image-digest.txt
            """.trimIndent()
        }
    }
    dependencies {
        snapshot(BuildAndTest) {}
        artifacts(BuildAndTest) {
            artifactRules = "reports/build-metadata.txt => upstream"
        }
    }
})
