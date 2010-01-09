class EssaysController < ApplicationController
  before_filter :require_user, :except => [:hexagon_index, :hexagon_show]

  # GET /essays
  # GET /essays.xml
  def index

    # debo de dar solo los que sean del current_user
    # debera de haber otra ruta con la cual otro usuario puede ver el index de otro...
    @essays = Essay.all(:conditions => { :user_id => current_user.id})

    # tengo que buscar el id de ese usuario...

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @essays }

    end
  end

  # PUBLIC
  def hexagon_index
    # Debo de dar solo los que sean del current_user
    # debera de haber otra ruta con la cual otro usuario puede ver el index de otro...
    # recibira los params con el nombre params[:user].id
    # @essays = Essay.all(:conditions => { :user_id => 1})

    @username = params[:username]
    user = User.find_by_login(@username)
    @essays = Essay.all(:conditions => { :user_id => user.id})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @essays }
    end
  end

  # GET /essays/:url_title.xml
  def show
    @essay = Essay.first(:conditions => { :url_title => params[:url_title], :user_id => current_user.id})
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @essay }
      format.pdf
    end
  end

  # PUBLIC
  def hexagon_show
    @username = params[:username]
    @user = User.find_by_login(@username)
    @essay = Essay.first(:conditions => { :url_title => params[:url_title], :user_id => @user.id})

    # @essays = Essay.first
    # @essay = Essay.find_by_url_title(params[:url_title]) if !params[:url_title].nil?

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @essay }
      format.pdf
    end
  end

  # GET /new/essays.html
  def new
    @essay = Essay.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @essay }
    end
  end

  # GET /edit/essays/:url_title
  def edit
    @essay = Essay.first(:conditions => { :url_title => params[:url_title], :user_id => current_user.id})
  end

  # POST /essays
  # POST /essays.xml
  def create
    @essay = Essay.new(params[:essay])
    @essay.user_id = current_user.id

    respond_to do |format|
      if @essay.save
        flash[:notice] = 'Essay was successfully created.'
        # format.html { redirect_to :action => 'show', :url_title => @essay.url_title }
        format.html { redirect_to "#{current_user.login}/essays/#{@essay.url_title}"}
        format.xml  { render :xml => @essay, :status => :created, :location => @essay }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @essay.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /essays/:url_title
  # PUT /essays/:url_title.xml
  def update
    @essay = Essay.find_by_url_title(params[:url_title]) if !params[:url_title].nil?

    respond_to do |format|
      if @essay.update_attributes(params[:essay])
        flash[:notice] = 'Essay was successfully updated.'
        # format.html { redirect_to :action => 'show', :url_title => @essay.url_title}
        format.html { redirect_to "#{current_user.login}/essays/#{@essay.url_title}"}
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
    # en este caso se usa params[:id] en vez de params[:url_title] como lo hice en el show
    @essay = Essay.find_by_url_title(params[:id]) if !params[:id].nil?
    @essay.destroy

    respond_to do |format|
      format.html { redirect_to(essays_url) }
      format.xml  { head :ok }
    end
  end
end
