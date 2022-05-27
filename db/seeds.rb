# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 1000.times do |i|
#     if i < 10
#         string = '000'
#     elsif i < 100
#         string = '00'
#     elsif i < 1000
#         string = '0'
#     else
#         string = ''
#     end
#     company_code = "AA" + string + i.to_s
#     Company.insert(company_code: company_code)
# end

# Company.all.each do |company|
#     100.times do |j|
#         CompanyProfile.insert(
#             company_id: company.id,
#             company_code: company.company_code,
#             company_name: "company" + company.company_code + "- #{j}",
#             company_email: "company" + company.company_code + "-#{j}@gmail.com",
#             phone_number: "0123268591",
#             address: "Ha Noi #{j}",
#             display_time: Date.today + j + 1,
#             display_flag: j == 0 ? 1 : 0,
#             created_at: Date.today,
#             updated_at: Date.today,
#             logo: ""
#         )
#     end
# end
