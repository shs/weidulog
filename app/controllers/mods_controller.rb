class ModsController < ApplicationController
  def index
    params[:order_by]        ||= 'name'
    params[:order_direction] ||= 'asc'

    @mods = Mod.order(params[:order_by] + ' ' + params[:order_direction])
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @mods }
    end
  end

  def show
    @mod = Mod.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @mod }
    end
  end

  def new
    @mod = Mod.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @mod }
    end
  end

  def edit
    @mod = Mod.find(params[:id])
  end

  def create
    @mod = Mod.new(params[:mod])

    respond_to do |format|
      if @mod.save
        format.html { redirect_to(@mod, :notice => 'Mod was successfully created.') }
        format.xml  { render :xml => @mod, :status => :created, :location => @mod }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mod.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mod = Mod.find(params[:id])
    
    respond_to do |format|
      if @mod.send(:update_without_password, params[:mod])
        format.html { redirect_to(@mod, :notice => 'Mod was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mod.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @mod = Mod.find(params[:id])
    @mod.destroy

    respond_to do |format|
      format.html { redirect_to(mods_url) }
      format.xml  { head :ok }
    end
  end
end