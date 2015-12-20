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

c1 = Course.create(name: "Web Development Immersive", description: "Full-Stack Engineering")
c2 = Course.create(name: "Mindfulness for Entrepreneurs", description: "Zen meditation practices for self-starters, meets 3x a week, from 10a-11a M, W, F")
c3 = Course.create(name: "Business Development Bootcamp", description: "Learn how to build relationships with clients and parent organizations alike")

st1 = Status.create(name: "Rejected")
st2 = Status.create(name: "Application Submitted")
st3 = Status.create(name: "Phone Interview Scheduled")
st4 = Status.create(name: "Phone Interview Completed")
st5 = Status.create(name: "Phone Interview Passed")
st5 = Status.create(name: "In Person Interview Scheduled")
st6 = Status.create(name: "In Person Interview Completed")
st7 = Status.create(name: "Accepted")

a1 = Application.create(student_id: s1.id, course_id: c1.id, status_id: st2.id, notes: "Great candidate!")
a2 = Application.create(student_id: s2.id, course_id: c1.id, status_id: st3.id, notes: "Lacks experience but looks promising")
a3 = Application.create(student_id: s2.id, course_id: c2.id, status_id: st4.id, notes: "Very enthusiastic, spent a semester in college at a monastic retreat")
a4 = Application.create(student_id: s3.id, course_id: c1.id, status_id: st5.id, notes: "Wants to start their own business, looking for networking opportunities")

# qn1 = Questionnaire.create(questionnaire_type: "Instructor", course: c1)

# q1 = Question.create(content: "Tell us about a time you overcame a challenge.", questionnaire_id: qn1.id)

# an1 = Answer.create(content: "One time...", question: q1, user_id: i1.id, application: a1)

c1.instructors.push(i1)
c1.officers.push(o1)




