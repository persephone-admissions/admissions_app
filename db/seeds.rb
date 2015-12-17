# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.destroy_all
Course.destroy_all
Application.destroy_all
Questionnaire.destroy_all
Question.destroy_all
Answer.destroy_all

s1 = User.create(first_name: "Nona", last_name: "Spinelli", type: "Student", email: "nspinelli72@gmail.com", password: "abc123", phone_number: "212.396-4487", street_address: "1277 Myrtle Ave, Apt 2B", city: "Brooklyn", state: "NY", country: "USA")
s2 = User.create(first_name: "Billy", last_name: "Jones", type: "Student", email: "b.t.jones@hotmail.com", password: "lizard22", phone_number: "843-223-6028", street_address: "894 Bergen St, Apt 118", city: "Brooklyn", state: "NY", country: "USA")
s3 = User.create(first_name: "Vicky", last_name: "T.", type: "Student", email: "vicktorious@gmail.com", password: "gomets", phone_number: "(703)256-1184", street_address: "88 E 22nd St, Apt 4D", city: "Manhattan", state: "NY", country: "USA")

i1 = User.create(first_name: "Kevin", last_name: "Hensing", type: "Instructor", email: "kevhen@ga.com", password: "shiva", phone_number: "(932)305-6952", street_address: "444 Leonard St, PH", city: "Manhattan", state: "NY", country: "USA")
o1 = User.create(first_name: "Michelle", last_name: "Spyridou", type: "Officer", email: "m.spyridou@ga.com", password: "drag0nz", phone_number: "449-637-1950", street_address: "1283 2nd Ave, Apt 16", city: "Manhattan", state: "NY", country: "USA")

s1 = Status.create(name: "Awaiting Text File Submission")

c1 = Course.create(start_on: Date.new(09-11-2016), end_on: Date.new(12-18-2016), description: "Web Development Immersive", city: "San Francisco, CA")



