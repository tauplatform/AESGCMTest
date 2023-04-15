require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TestModelController < Rho::RhoController
  include BrowserHelper

  def fill_items
      for i in 1..100 do
            item = TestModel.new
            item.data1 = "Value1 "+i.to_s+" qwerty1234567890qwerty"
            item.data2 = "Value2 "+i.to_s+" qwerty1234567890qwerty"
            item.data3 = "Value3 "+i.to_s+" qwerty1234567890qwerty"
            item.save
       end
  end

  # GET /TestModel
  def index
    @testmodels = TestModel.find(:all)
    render :back => '/app'
  end

  def generate_100
      fill_items
      redirect :action => :index
  end

  # GET /TestModel/{1}
  def show
    @testmodel = TestModel.find(@params['id'])
    if @testmodel
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /TestModel/new
  def new
    @testmodel = TestModel.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /TestModel/{1}/edit
  def edit
    @testmodel = TestModel.find(@params['id'])
    if @testmodel
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /TestModel/create
  def create
    @testmodel = TestModel.create(@params['testmodel'])
    redirect :action => :index
  end

  # POST /TestModel/{1}/update
  def update
    @testmodel = TestModel.find(@params['id'])
    @testmodel.update_attributes(@params['testmodel']) if @testmodel
    redirect :action => :index
  end

  # POST /TestModel/{1}/delete
  def delete
    @testmodel = TestModel.find(@params['id'])
    @testmodel.destroy if @testmodel
    redirect :action => :index
  end
end
