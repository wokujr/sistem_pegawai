position1 = Position.create(title: "Manager", salary: 500)
position2 = Position.create(title: "SPV", salary: 400)
position3 = Position.create(title: "karyawan", salary: 300)
position4 = Position.create(title: "pinggiran", salary: 200)

karyawan1 = Karyawan.create(nama: "john", alamat: "somwhere a", usia: 53)
karyawan2 = Karyawan.create(nama: "jane", alamat: "somwhere b", usia: 43)
karyawan3 = Karyawan.create(nama: "jun", alamat: "somwhere c", usia: 33)
karyawan4 = Karyawan.create(nama: "jay", alamat: "somwhere d", usia: 23)

Salary.create(karyawan: karyawan1, position: position1, amount: position1.salary)
Salary.create(karyawan: karyawan2, position: position2, amount: position2.salary)
Salary.create(karyawan: karyawan3, position: position3, amount: position3.salary)
Salary.create(karyawan: karyawan4, position: position4, amount: position4.salary)

