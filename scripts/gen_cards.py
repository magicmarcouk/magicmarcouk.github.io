

values = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]
suits = ["clubs", "diamonds", "hearts", "spades"]

#
for value in values:
    #
    for suit in suits:
        
        #
        path = "_card/%s_of_%s.md"%(value, suit)
        
        # Create file
        with open(path, 'w') as f:
            f.write('---\n')
            f.write('layout: card\n')
            f.write('value: %s\n'%value)
            f.write('suit: %s\n'%suit)
            f.write('img: img/cards/%s_of_%s.png\n'%(value, suit))
            f.write('---\n')
            
