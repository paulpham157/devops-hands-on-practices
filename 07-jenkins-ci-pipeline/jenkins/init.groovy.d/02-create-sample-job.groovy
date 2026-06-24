import jenkins.model.Jenkins
import org.jenkinsci.plugins.workflow.cps.CpsFlowDefinition
import org.jenkinsci.plugins.workflow.job.WorkflowJob

def instance = Jenkins.get()
def jobName = System.getenv('JENKINS_SAMPLE_JOB_NAME') ?: 'docker-course-sample-app'
def jenkinsfilePath = '/workspace/devops-hands-on-07-jenkins-ci-pipeline/sample-app/Jenkinsfile'
def jenkinsfile = new File(jenkinsfilePath)

if (!jenkinsfile.exists()) {
  println("Sample Jenkinsfile not found at ${jenkinsfilePath}; skipping sample job creation")
  return
}

def job = instance.getItem(jobName)
if (job == null) {
  job = instance.createProject(WorkflowJob, jobName)
}

job.setDescription('Docker Course sample Pipeline job. Reads sample-app/Jenkinsfile from the mounted course repository.')
job.setDefinition(new CpsFlowDefinition(jenkinsfile.text, true))
job.save()

