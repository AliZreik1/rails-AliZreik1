# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Office.create!(building: 'AVZ' , floor: 1, number: 3)
Office.create!(building: 'AVZ' , floor: 1, number: 2)
offices =(1..8).map do |i|
	Office.create!(building: 'WA', floor: 0 , number: i)
end

ali = Employee.create!(fname: 'Ta7sin' , lname:'Mjaddara' , birthday: '2001-12-02', email: 'ta7sin@hassoun.de' )
bot = Employee.create!(fname: 'Ahmad' , lname:'Mlou5iye' , birthday: '1996-12-02', email: 'Ahmad@egal.de' )
others = (1..20).each do |i|
	office = offices.shuffle.first
	bot = Employee.create!(office: office, fname: "E#{i}" , lname: "a#{i}" , birthday: "#{1996+i}-12-02", email: "a#{i}@egal.de" )
end
