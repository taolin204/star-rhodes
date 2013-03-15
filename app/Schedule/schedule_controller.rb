require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ScheduleController < Rho::RhoController
  include BrowserHelper

  # GET /Schedule
  def index
    @schedules = Schedule.find(:all)
    render :back => '/app'
  end

  # GET /Schedule/{1}
  def show
    @schedule = Schedule.find(@params['id'])
    if @schedule
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Schedule/new
  def new
    @schedule = Schedule.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Schedule/{1}/edit
  def edit
    @schedule = Schedule.find(@params['id'])
    if @schedule
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Schedule/create
  def create
    @schedule = Schedule.create(@params['schedule'])
    redirect :action => :index
  end

  # POST /Schedule/{1}/update
  def update
    @schedule = Schedule.find(@params['id'])
    @schedule.update_attributes(@params['schedule']) if @schedule
    redirect :action => :index
  end

  # POST /Schedule/{1}/delete
  def delete
    @schedule = Schedule.find(@params['id'])
    @schedule.destroy if @schedule
    redirect :action => :index  
  end
end
