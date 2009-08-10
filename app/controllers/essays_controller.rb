class EssaysController < ApplicationController
  # GET /essays
  # GET /essays.xml
  def index
    @essays = Essay.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @essays }
    end
  end

  # GET /essays/1
  # GET /essays/1.xml
  def show
    @essay = Essay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @essay }
    end
  end

  # GET /essays/new
  # GET /essays/new.xml
  def new
    @essay = Essay.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @essay }
    end
  end

  # GET /essays/1/edit
  def edit
    @essay = Essay.find(params[:id])
  end

  # POST /essays
  # POST /essays.xml
  def create
    @essay = Essay.new(params[:essay])

    respond_to do |format|
      if @essay.save
        flash[:notice] = 'Essay was successfully created.'
        format.html { redirect_to(@essay) }
        format.xml  { render :xml => @essay, :status => :created, :location => @essay }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @essay.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /essays/1
  # PUT /essays/1.xml
  def update
    @essay = Essay.find(params[:id])

    respond_to do |format|
      if @essay.update_attributes(params[:essay])
        flash[:notice] = 'Essay was successfully updated.'
        format.html { redirect_to(@essay) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @essay.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1
  # DELETE /essays/1.xml
  def destroy
    @essay = Essay.find(params[:id])
    @essay.destroy

    respond_to do |format|
      format.html { redirect_to(essays_url) }
      format.xml  { head :ok }
    end
  end
end
