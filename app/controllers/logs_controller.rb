class LogsController < ApplicationController
  def index
    params[:order_by]        ||= 'created_at'
    params[:order_direction] ||= 'desc'

    if filters = params[:filters].try(:dup)
      date = filters.delete(:created_at_eq)

      unless date.blank?
        filters[:created_at_greater_than] = Time.parse(date).to_s(:db)
        filters[:created_at_less_than]    = Time.parse(date).tomorrow.to_s(:db)
      end

      @logs = Log.order(params[:order_by] + ' ' + params[:order_direction]).search(filters).all
    else
      @logs = Log.order(params[:order_by] + ' ' + params[:order_direction])
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @logs }
    end
  end

  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @log }
    end
  end

  def new
    @log = Log.new
    @log.content = LogContent.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @log }
    end
  end

  def create
    @log = Log.new(params[:log])

    respond_to do |format|
      if verify_recaptcha(:model => @log) && @log.save
        format.html { redirect_to(@log, :notice => 'Log was successfully created.') }
        format.xml  { render :xml => @log, :status => :created, :location => @log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end
end
