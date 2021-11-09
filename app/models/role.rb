class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.pluck(:actor)
  end

  def locations
    self.auditions.pluck(:location)
  end

  def lead
    lead = self.auditions.find_by(hired: true)
    if lead == nil
        return "no actor has been hired for this role"
    else
        return lead
    end
  end

  def understudy
    understudy = self.auditions.where(hired: true).second
    if understudy == nil
        return "no actor has been hired for understudy for this role"
    else
        return understudy
    end
  end
end