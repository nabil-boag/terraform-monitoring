module "hello-world-service" {
  source          = "../../../modules/nginx-application"

  key_name         = "hello-world-service-key"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  vpc_id           = "${var.vpc_id}"
  subnet_id        = "${var.subnet_id}"
}

# Configure the New Relic provider
provider "newrelic" {
  api_key = "${var.newrelic_api_key}"
}

# Create an alert policy
resource "newrelic_alert_policy" "alert" {
  name = "${var.service_name}"
}

# Add a notification channel
resource "newrelic_alert_channel" "service_team_email" {
  name = "${var.service_name} - Team Email"
  type = "email"

  configuration = {
    recipients              = "${var.service_team_email}"
    include_json_attachment = "1"
  }
}

# Link the channel to the policy
resource "newrelic_alert_policy_channel" "alert_email" {
  policy_id  = "${newrelic_alert_policy.alert.id}"
  channel_id = "${newrelic_alert_channel.service_team_email.id}"
}

# This has to be created manually :(
data "newrelic_synthetics_monitor" "synthetics" {
  name = "Hello World Monitor"
}

resource "newrelic_synthetics_alert_condition" "synthetics_alert_condition" {
  policy_id = "${newrelic_alert_policy.alert.id}"

  name        = "Hello World Service - Alert Condition"
  monitor_id  = "${data.newrelic_synthetics_monitor.synthetics.id}"
  runbook_url = "https://github.com/nabil-boag/terraform-monitoring/wiki/Run-Book---Hello-World-Service---Website-not-loading"
}
