demo = User.create({name: "Demo Account", phone: "123-456-7890", email: "demo@demo.com"})
demo.save
demo_account = Account.create({username: "demo", password: "demo", user_id: demo.id})

mickey = User.create({name: "Mickey Mouse", phone: "123-456-7890", email: "Mickey@mouse.com"})
mickey.save
mickey_account = Account.create({username: "mickey", password: "mickeymaster", user_id: mickey.id})
mickey_account.save

minnie = User.create({name: "Minnie Mouse", phone: "123-456-7890", email: "Minnie@mouse.com"})
minnie.save
minnie_account = Account.create({username: "minnie", password: "minniemaster", user_id: minnie.id})
minnie_account.save

donald = User.create({name: "Donald Duck", phone: "123-456-7890", email: "Donald@duck.com"})
donald.save
donald_account = Account.create({username: "donald", password: "donaldmaster", user_id: donald.id})
donald_account.save