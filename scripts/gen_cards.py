
#
# Function to write out md file
#
def write_card_md(output_path, img, value, suit):
    
    # String containing page title
    title = "%s"%value
    if suit != "":
        title += " of %s"%(suit)
    
    # Create file
    with open(output_path, 'w') as f:
        f.write('---\n')
        f.write('layout: card\n')
        f.write('title: %s\n'%(title) )
        f.write('value: %s\n'%value)
        if suit != "":
            f.write('suit: %s\n'%suit)
        f.write('img: %s\n'%img)
        f.write('---\n')

suits = {
    "C": "Clubs",
    "D": "Diamonds",
    "H": "Hearts",
    "S": "Spades",
}

values = {
    "A":"Ace",
    "2":"Two",
    "3":"Three",
    "4":"Four",
    "5":"Five",
    "6":"Six",
    "7":"Seven",
    "8":"Eight",
    "9":"Nine",
    "10":"Ten",
    "J":"Jack",
    "Q":"Queen",
    "K":"King",
}

# Generate Cards
for value in values:
    for suit in suits:
        #
        path = "_card/%s%s.md"%(value, suit)
        img = "img/cards/%s%s.png"%(value, suit)
        write_card_md(path, img, values[value], suits[suit])

# Generate Joker
path = "_card/JO.md"
img = "img/cards/JO.png"
write_card_md(path, img, "Joker", "")


