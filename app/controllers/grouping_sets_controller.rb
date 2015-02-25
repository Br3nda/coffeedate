class GroupingSetsController < ApplicationController
  def new
    @set = GroupingSet.new(:group => current_group)
  end

  def create
    @set = GroupingSet.new(set_params)
    @set.group = current_group
    @set.member_count = current_group.members.count
    @set.save

    # actually do the logic for groupings
    @set.populate

    redirect_to group_grouping_set_path @set.group, @set
  end

  def show
    @set = current_grouping_set
  end

  private
    def current_group
      Group.where(:id => params[:group_id], :user => current_user).first
    end

    def current_grouping_set
      GroupingSet.where(:id => params[:id], :group => current_group).first
    end

    def set_params
      params.require(:grouping_set).permit(:group_size, :title, :description)
    end  

end
