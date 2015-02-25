class Grouping < ActiveRecord::Base
  belongs_to :grouping_set

  belongs_to :member1, class_name: "Member"
  belongs_to :member2, class_name: "Member"
  belongs_to :member3, class_name: "Member"
  belongs_to :member4, class_name: "Member"
  belongs_to :member5, class_name: "Member"

  # convenience method
  def members
    [member1, member2, member3, member4, member5].reject { |e| e == nil }
  end
end
