

values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
suits = ["C", "D", "H", "S"]

# Generate Card Values
for value in values:
    # Generate Card Suits
    for suit in suits:
        
        #
        path = "_card/%s%s.md"%(value, suit)
        
        # Create file
        with open(path, 'w') as f:
            f.write('---\n')
            f.write('layout: card\n')
            f.write('value: %s\n'%value)
            f.write('suit: %s\n'%suit)
            f.write('img: img/cards/%s%s.png\n'%(value, suit))
            f.write('---\n')
            
# Joker


# Create file
path = "_card/JO.md"
with open(path, 'w') as f:
    f.write('---\n')
    f.write('layout: card\n')
    f.write('value: %s\n'%value)
    f.write('suit: %s\n'%suit)
    f.write('img: img/cards/JO.png\n')
    f.write('---\n')
