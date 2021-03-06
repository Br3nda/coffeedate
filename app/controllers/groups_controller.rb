class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @new_group = new_group
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    @group.save

    redirect_to group_path @group
  end

  def destroy
    @group = Group.where(:user => current_user, :id => params[:id])
    @group.destroy_all

    redirect_to groups_path
  end

  def show
    @group = current_group
    @new_member = Member.new(:group => @group)
  end

  private
    def new_group
      Group.new(:user => current_user)
    end

    def current_group
      Group.where(:user => current_user, :id => params[:id]).first
    end

    def group_params
      params.require(:group).permit(:title)
    end
end
