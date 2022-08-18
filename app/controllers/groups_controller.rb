class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  def index
    @groups = Group.page(params[:page]).per(6).order(id: :desc) 
  end

  def show
    session[:group_id] = @group.id
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    @group.user = current_user
    @m = @group.memberships.new(:user_id => current_user.id)
    session[:group_id] = @group.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.articles.ids.clear
    @group.articles.clear  
    @group.users.clear  
    @group.memberships.clear                    # << add this line
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def join
    @group = Group.find(params[:id])
    category = @group.category
    if category == "Public"
      @m = @group.memberships.build(:user_id => current_user.id)
      respond_to do |format|
        if @m.save
          format.html { redirect_to(@group, :notice => "You have joined this group.") }
          format.xml { head :ok }
        else
          format.html { redirect_to(@group, :notice => "You have already joined this group") }
          format.xml { render :xml => @group.errors, :status => :unprocessable_entity }
        end
      end
      else
        @group.memberships.where(user_id: current_user.id).first_or_create
        respond_to do |format|
      
        format.html { redirect_to(groups_path, :notice => "Joining request sent.") }
        end
     
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:group_name, :category, :user_id, :image)
  end
end
