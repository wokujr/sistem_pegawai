# position1 = Position.create(title: "Manager", salary: 500 )
# position2 = Position.create(title: "SPV", salary: 400)
# position3 = Position.create(title: "karyawan", salary: 300)
# position4 = Position.create(title: "pinggiran", salary: 200)
#
# Karyawan.create(name: "john", address: "somwhere a", age: 53)
# Karyawan.create(name: "jane", address: "somwhere b", age: 43)
# Karyawan.create(name: "jun", address: "somwhere c", age: 33)
# Karyawan.create(name: "jay", address: "somwhere d", age: 23)


Position.create(title: 'Manager', salary: 500)
Position.create(title: 'Supervisor', salary: 300)
Position.create(title: 'SPV', salary: 400)
Position.create(title: "karyawan", salary: 200)

User.create(
  username: "john doe",
  email: "john1@email.com",
   password: "sad",
  admin:  true)

   User.create(
    username: "john doe2",
    email: "john2@email.com",
    password: "sad")

    User.create(
      username: "john doe3",
      email: "john3@email.com",
      password: "sad")
