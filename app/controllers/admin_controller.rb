class AdminController < ApplicationController
  def index
    @jira_enabled = false
    @slack_enabled = true
    @sendgrid_enabled = true
  end

  def sendgrid
  end

  def slack
  end

  def setup
  end

end
