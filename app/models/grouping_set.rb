class GroupingSet < ActiveRecord::Base
  belongs_to :group

  has_many :groupings, foreign_key: :grouping_set_id

  def displayed_title
    if title.empty?
      "My grouping"
    else
      title
    end
  end

  ###
   # Actually populate the current grouping sets with lots of groups
   # from the current member list.
  ###
  def populate
    group.members.each_slice(group_size).to_a.shuffle.each do |members|
      grouping = Grouping.new(:grouping_set => self)
      if members.count > 0
        grouping.member1 = members[0]
      end
      if members.count > 1
        grouping.member2 = members[1]
      end
      if members.count > 2
        grouping.member3 = members[2]
      end
      if members.count > 3
        grouping.member4 = members[3]
      end
      if members.count > 4
        grouping.member5 = members[4]
      end
      grouping.save
    end
  end
end
