require 'rho/rhocontroller'
require 'helpers/browser_helper'

class IntervieweeController < Rho::RhoController
  include BrowserHelper

  # GET /Interviewee
  def index
    @interviewees = Interviewee.find(:all)
    render :back => '/app'
  end

  # GET /Interviewee/{1}
  def show
    @interviewee = Interviewee.find(@params['id'])
    if @interviewee
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Interviewee/new
  def new
    @interviewee = Interviewee.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Interviewee/{1}/edit
  def edit
    @interviewee = Interviewee.find(@params['id'])
    if @interviewee
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Interviewee/create
  def create
    @interviewee = Interviewee.create(@params['interviewee'])
    redirect :action => :index
  end

  # POST /Interviewee/{1}/update
  def update
    @interviewee = Interviewee.find(@params['id'])
    @interviewee.update_attributes(@params['interviewee']) if @interviewee
    redirect :action => :index
  end

  # POST /Interviewee/{1}/delete
  def delete
    @interviewee = Interviewee.find(@params['id'])
    @interviewee.destroy if @interviewee
    redirect :action => :index  
  end
end
