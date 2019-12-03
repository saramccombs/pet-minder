sara = User.create(
    name: "Sara McCombs",
    phone: "304-867-5309",
    email: "theSaraMcCombs@gmail.com"
)

brandon = User.create(
    name: "Brandon McCombs",
    phone: "304-867-5309",
    email: "brandon@brandon.com"
)

tumblr = Pet.create(
    name: "Tumblr",
    breed: "Bernese Mountain Dog",
    color: "Tri-Color", 
    food_name: "Royal Canin Large Digestive Care Dry Dog Food",
    feeding_instructions: "Give 1 1/2 cups twice a day, add 1 cup warm water immediately before serving.",
    medications: "Prednisone (AM - 1/2 pill), Prozac (AM - 1 tablet)",
    user_id: 2
)
