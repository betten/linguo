class LevelsController < ApplicationController
  # GET /levels
  # GET /levels.xml
  def index
    redirect_to language_path(params[:language_id])
    #@levels = Level.all

    #respond_to do |format|
      #format.html # index.html.erb
      #format.xml  { render :xml => @levels }
    #end
  end

  # GET /levels/1
  # GET /levels/1.xml
  def show
    @level = Level.find(params[:id])

    respond_to do |format|
      format.html {
        if @level.is_vocab?
          render 'vocabs/show'
        else
          render 'sentences/show'
        end
      }
      format.xml  { render :xml => @level }
    end
  end

  def test
    @level = Level.find(params[:id])

    if @level.is_vocab?
      @testing = @level.vocab
    else
      @testing = @level.sentences
    end
  end

  # GET /levels/new
  # GET /levels/new.xml
  def new
    @level = Level.new
    @language = Language.find(params[:language_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @level }
    end
  end

  # GET /levels/1/edit
  def edit
    @level = Level.find(params[:id])
  end

  # POST /levels
  # POST /levels.xml
  def create
    @level = Level.new(params[:level])
    @language = Language.find(params[:language_id])

    @level.language = @language

    respond_to do |format|
      if @level.save
        format.html { redirect_to(@level, :notice => 'Level was successfully created.') }
        format.xml  { render :xml => @level, :status => :created, :location => @level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /levels/1
  # PUT /levels/1.xml
  def update
    @level = Level.find(params[:id])
    @language = @level.language

    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to(@level, :notice => 'Level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.xml
  def destroy
    @level = Level.find(params[:id])
    @language = @level.language
    @level.destroy

    respond_to do |format|
      format.html { redirect_to(@language) }
      format.xml  { head :ok }
    end
  end
end
