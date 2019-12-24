demo = User.create({name: "Demo Account", phone: "123-456-7890", email: "demo@demo.com"})
demo.save
demo_account = Account.create({username: "demo", password: "demo", user_id: demo.id})