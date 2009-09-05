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

  # GET /essays/:title.xml
  def show
    #     @essay = Essay.find(params[:id]) unless !params[:id].nil?
    @essay = Essay.find_by_title(params[:title]) if !params[:title].nil?

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @essay }
    end
  end

  # No se van a permitir named routes. puro REST
  # GET /essays/new
  # GET /essays/new.xml
  # def new
  #     @essay = Essay.new

  #     respond_to do |format|
  #       format.html # new.html.erb
  #       format.xml  { render :xml => @essay }
  #     end
  #   end

  # GET /essays/1/edit
  #   def edit
  #     @essay = Essay.find(params[:id])
  #   end

  # POST /essays
  # POST /essays.xml
  def create
    @essay = Essay.new(params[:essay])

    p "mi titulo es aaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    p @essay.title

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
    #     @essay = Essay.find(params[:id])
    @essay = Essay.find_by_title(params[:title]) if !params[:title].nil?
    
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
    # @essay = Essay.find(params[:id])
    # Lo que pasa es que el metodo delete me pasa una id en los params de a afuerzas
    # en este caso se usa params[:id] en vez de params[:title] como lo hice en el show
    @essay = Essay.find_by_title(params[:id]) if !params[:id].nil?
    puts "holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    p @essay.inspect
    # @essay2 = Essay.find(@essay.id)
    @essay.destroy

    respond_to do |format|
      format.html { redirect_to(essays_url) }
      format.xml  { head :ok }
    end
  end
end
