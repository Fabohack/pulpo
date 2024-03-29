class ProjectsController < ApplicationController
  before_filter :verify_admin, :only => [:create, :destroy, :new, :edit]
  
  # GET /projects
  # GET /projects.json
  def index
    if current_user.admin == 1
      @projects = Project.all
    else
      @projects = current_user.projects
      if @projects.count == 1
        redirecting = 1
        redirect_to project_path(@projects.first)
      end
    end
    if redirecting.nil?
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @projects }
      end
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if current_user.admin == 1
      @project = Project.find(params[:id] || params[:project_id])
    else
      @project = current_user.projects.find(params[:id] || params[:project_id])
    end

    if params[:status] == "closed"
      @tasks = @project.tasks.order('id DESC').where(:closed => 1)
    else
      @tasks = @project.tasks.order('id DESC').where("closed IS NULL OR closed = 0")
    end
    @open = @project.tasks.order('id DESC').where("closed IS NULL OR closed = 0")
    @closed = @project.tasks.where(:closed => 1)
    
    if params[:status] == "activas"
      @tasks = @project.tasks.order('id DESC').where(:state => 1  ) # Estado Activo  aqui agregar para que ordene por secuence
    end
    if params[:status] == "cerradas"
      @tasks = @project.tasks.order('id DESC').where(:state => 2) # Estado Cerrada aqui agregar para que ordene por secuence
    end
    if params[:status] == "obsoleta"
      @tasks = @project.tasks.order('id DESC').where(:state => 3) # Estado Obsoleta aqui agregar para que ordene por secuence
    end
    if params[:status] == "cortada"
      @tasks = @project.tasks.order('id DESC').where(:state => 4) # Estado Cortada aqui agregar para que ordene por secuence
    end
    if params[:status] == "enprogreso"
      @tasks = @project.tasks.order('id DESC').where(:state => 5, :assigned_to_id => current_user.id) # Estado En progreso aqui agregar para que ordene por secuence
    end
    
    if params[:status] == "alta"
      @tasks = @project.tasks.order('id DESC').where(:complexity => 1, :assigned_to_id => current_user.id) 
    end
    
    if params[:status] == "media"
      @tasks = @project.tasks.order('id DESC').where(:complexity => 2, :assigned_to_id => current_user.id) 
    end
    
    if params[:status] == "baja"
      @tasks = @project.tasks.order('id DESC').where(:complexity => 3, :assigned_to_id => current_user.id) 
    end
    @todas = @project.tasks.where( :assigned_to_id => current_user.id)
    @activas = @project.tasks.where(:state=> 1)
    @cerradas = @project.tasks.where(:state => 2)
    @obsoleta = @project.tasks.where(:state => 3)
    @cortada = @project.tasks.where(:state => 4)
    @enprogreso = @project.tasks.where(:state => 5)
    
    @alta = @project.tasks.where(:complexity => 1)
    @media = @project.tasks.where(:complexity => 2)
    @baja = @project.tasks.where(:complexity => 3)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
end
