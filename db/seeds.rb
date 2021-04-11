#-------------------------ADVISERS----------------------------------------------
Driver.find_or_create_by(
  name: "Juan Perez",
  email: "JP@email.com",
  status: "available",
  license_plate: "DSF163"
)
Driver.find_or_create_by(
  name: "Pedro Fonnegra",
  email: "PF@email.com",
  status: "unavailable",
  license_plate: "DDF645"
)
Driver.find_or_create_by(
  name: "Andres Medina",
  email: "AM@email.com",
  status: "available",
  license_plate: "LKS354"
)
Driver.find_or_create_by(
  email: "AdddM@email.com",
  status: "available",
  license_plate: "LKS354"
)

#-------------------------RIDERS------------------------------------------------
Rider.find_or_create_by(
  name: "Jenny Patiño",
  email: "JP@email.com",
  status: "not_ride",
  payment_method: "CARD"
)
Rider.find_or_create_by(
  name: "Laura Gonzales",
  email: "LG@email.com",
  status: "not_ride",
  payment_method: "CARD"
)
Rider.find_or_create_by(
  name: "John Cuervo",
  email: "JC@email.com",
  status: "in_ride",
  payment_method: "CARD"
)
