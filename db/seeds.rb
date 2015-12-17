# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Course.destroy_all
Application.destroy_all

Student.destroy_all

s1 = Student.create(first_name: "Nona", last_name: "Spinelli", email: "nspinelli72@gmail.com", password: "abc123", phone_number: "212.396-4487", street_address: "1277 Myrtle Ave, Apt 2B", city: "Brooklyn", state: "NY", country: "USA")
s2 = Student.create(first_name: "Billy", last_name: "Jones", email: "b.t.jones@hotmail.com", password: "lizard22", phone_number: "843-223-6028", street_address: "894 Bergen St, Apt 118", city: "Brooklyn", state: "NY", country: "USA")
s3 = Student.create(first_name: "Vicky", last_name: "T.", email: "vicktorious@gmail.com", password: "gomets", phone_number: "(703)256-1184", street_address: "88 E 22nd St, Apt 4D", city: "Manhattan", state: "NY", country: "USA")

i1 = Employee.create(first_name: "Kevin", last_name: "Hensing", type: "Instructor", email: "kevhen@ga.com", password: "shiva")
o1 = Employee.create(first_name: "Michelle", last_name: "Spyridou", type: "Officer", email: "m.spyridou@ga.com", password: "drag0nz")
