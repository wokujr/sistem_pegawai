class KaryawanPilicy < ApplicationPolicy
  def show?
    record.user == user
  end
end