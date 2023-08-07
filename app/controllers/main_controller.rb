class MainController < ApplicationController

  def index
    @karyawan = Karyawan.all
  end

end
