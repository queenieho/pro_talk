# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



verified_user_one = User.create!( email: "hello@mail.com",
                                  password: "password", password_confirmation: "password",
                                  age: 25, gender: "Mx",
                                  religion: "agnostic", verified: true,
                                  username: "LaCroix", city: "San Francisco",
                                  state: "CA", admin: false)

admin_user = User.create!(  email: "access@mail.com",
                            password: "password", password_confirmation: "password",
                            age: 35, gender: "Ms",
                            religion: "buddhist", verified: true,
                            username: "Happy", city: "San Francisco",
                            state: "CA", admin: true)

verified_user_two = User.create!( email: "user@mail.com",
                                  password: "password", password_confirmation: "password",
                                  age: 45, gender: "Mr",
                                  religion: "unsure", verified: true,
                                  username: "Aarav", city: "San Francisco",
                                  state: "CA", admin: false)

unverified_user = User.create!( email: "codeless@mail.com",
                                password: "password", password_confirmation: "password",
                                age: 55, gender: "Mrs",
                                religion: "spiritual", verified: false,
                                username: "Anna", city: "San Francisco",
                                state: "CA", admin: false)

story_one = Story.create!( title: "consectetur adipiscing elit",
                          published: true,
                          user_id: verified_user_one.id,
                          content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Donec congue convallis vulputate. Etiam est est, congue at aliquet at,
                                    faucibus ac dolor. Sed at ligula neque. Aliquam tincidunt ullamcorper
                                    lacus id pharetra. Maecenas porta purus vitae dolor dapibus, a efficitur
                                    turpis ultricies. Duis vel laoreet justo. Nam posuere lacus et risus tincidunt,
                                    ac commodo urna pulvinar. Nulla facilisi. Phasellus varius risus sed egestas tempus.
                                    Duis vestibulum, nibh non placerat tempus, mauris lacus interdum nibh, et fringilla
                                    risus tellus nec lacus. Mauris accumsan rutrum congue. Proin tempor magna in urna
                                    convallis consequat. Aenean non sollicitudin sem, luctus congue tortor.
                                    Nunc accumsan molestie magna, sit amet euismod nunc pellentesque a. Curabitur ac
                                    ipsum pretium, aliquet dolor non, congue sem. Nunc ligula nunc, convallis sit amet
                                    facilisis et, luctus vel justo. Nam egestas ligula eget sem commodo commodo.")

story_two = Story.create!( title: "Duis condimentum egestas",
                          published: true,
                          user_id: admin_user.id,
                          content: "Duis condimentum egestas urna a sollicitudin. Aliquam pretium at tellus nec interdum.
                                    Aenean semper metus sem, ut lacinia lorem volutpat sit amet. Duis vel rutrum mauris.
                                    Curabitur mi ligula, vulputate quis enim in, porta eleifend orci. Cras diam turpis,
                                    ullamcorper vitae pretium a, molestie id mi. Ut ornare lorem magna, a tempus libero posuere
                                    quis. Donec convallis nunc vitae mi mattis, eu rutrum nibh molestie. In maximus ante erat,
                                    nec vulputate diam aliquam vitae. Nullam ligula sem, iaculis nec libero sit amet, pretium
                                    sodales ipsum. Sed ullamcorper quis risus nec sodales. Donec et congue dui. Duis efficitur
                                    ligula placerat nisi volutpat, eget dapibus ipsum aliquet. Aliquam fringilla,
                                    libero nec dictum dignissim, diam ex tempor sem, vel molestie felis orci vitae nunc.
                                    Integer a feugiat enim. Nullam mattis aliquet nunc eu bibendum. Cras tempor mi iaculis
                                    ornare dictum. Sed in nunc nec velit scelerisque efficitur. Aliquam malesuada pretium molestie.
                                    Fusce eros lorem, pharetra eu eros at, maximus laoreet lorem.")

verified_user_one.stories << story_one
admin_user.stories << story_two