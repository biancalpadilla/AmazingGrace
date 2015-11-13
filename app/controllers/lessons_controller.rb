class LessonsController < ApplicationController

  def dragndrop
  end

  def quiz
  end

  def materials
  end

  def setup
  end

  def raspi
  end

  def main
  end

  def code
  end

  def html
  end

  def leaderboard
    @users = User.all.sort{ |x, y| y.score <=> x.score }
  end


end
