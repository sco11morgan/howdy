class AdminController < ApplicationController
  def connections
    @jira_enabled = false
    @slack_enabled = true
    @sendgrid_enabled = true
  end


end
