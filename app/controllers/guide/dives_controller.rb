class Guide::DivesController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    @dives = current_user.dives
  end

  def new

  end

  def create

  end
end
