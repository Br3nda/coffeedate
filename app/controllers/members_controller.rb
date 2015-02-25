class MembersController < ApplicationController

  def create
    @member = Member.new(member_params)
    @member.group = current_group
    @member.save

    redirect_to group_path current_group
  end

  def destroy
    @member = Member.where(:group => current_group, :id => params[:id])
    @member.destroy_all

    redirect_to group_path current_group
  end  

  private
    def current_group
      Group.where(:id => params[:group_id], :user => current_user).first
    end

    def member_params
      params.require(:member).permit(:email, :group)
    end  

end
