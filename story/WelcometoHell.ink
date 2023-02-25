//Overall variables
VAR lucifer = 0
//Introduction Variables
VAR gangsFlag = false
VAR drugsFlag = false
VAR poliFlag = false
VAR notSevenDeadly = true

VAR warMet = false
VAR famineMet = false
VAR lucyMet = false
VAR deathMet = false
VAR conquestMet = false
VAR sevenDeadlyKnow = false

VAR startFlags = 0

//Introduction Transcendatory Variables
VAR theirNames = false

//Section 2 Variables
VAR askFlag = false
VAR coolGuyFlag = false
VAR awkwardFlag = false
VAR contFlag1 = true

//Section 3
VAR youFlag = true
VAR tableFlag = true
VAR themCount = 0
VAR deathFlag = true
VAR warFlag = true
VAR conquestFlag = true
VAR famineFlag = true

//Final Section
VAR Job = false
VAR luciferFirstTime = true
VAR JobFlag = false
VAR park = false
VAR work = false
VAR party = false

-> start

=== start ===
     Please set the theme into Dark Mode by selecting the 'theme' icon in the top right. #CLASS: warn
     A known bug with Ink is that images will offset choices underneath the viewing area. #CLASS: warn
     When this happens, please save your game and load it by selecting the 'save' and 'load' icon in the top right. #CLASS: warn
     *[I'm Ready]
        ->section1

=== section1 ===
-   'So, what about...'
- (startOpts1)
{startFlags >=2:
    -> startOpts2 //unlock all options after condition met by moving
}
{startFlags < 2 && startFlags != 0: But, what about | }
*'Gangs'
bar #CLASS: bar
    'Like the mafia, the triad, Al Capone'
    
    "I mean, it sucks. People doing terrible things in pursuit of Greed. He isn't even the coolest one. However, {startFlags < 1: It is a grey area. Some do it to protect those they love. Others seek to hurt | as with all your questions, the matter is grey.}" {lucyMet: Lucifer replies. | the reverbating voice replied.} #CLASS: lcfr
    ~ gangsFlag = true
    ~ startFlags +=1
    -> startOpts1

*'Drugs'
bar #CLASS: bar
    "In general? I think they're fine. A natural consequence of nature. However, {startFlags < 1: It is a grey area. Some do it to protect those they love. Others seek to hurt | as with all your questions, the matter is grey.}" {lucyMet: Lucifer replies. | the reverbating voice replied.} #CLASS: lcfr
    "Crack gives birth to the warrior inside. You could stand to take advantage of such." {warMet: War adds in. | another man with large muscles adds.} #CLASS: war
    "I prefer the opiods a bit more, but War has a point. Warriors give lead to domination." {conquestMet: Conquest announces. | entered a man with fancy clothes.} #CLASS: cqst
    
    ~ warMet = true
    ~ drugsFlag = true
    ~ startFlags +=1
    -> startOpts1

*'Politicians'
bar #CLASS: bar
   "All evil. You need a special kind of narcissim to go into politics." {lucyMet: Lucifer replies. | the reverbating voice replied.} #CLASS: lcfr
   "Most are fine. They seek to improve the lives of those they represent. Others? Their actions lead many to suffer callously, and muddy the name of those who mean good. Keeps Death busy, however." {conquestMet: Conquest announces. | entered a man with fancy clothes.} #CLASS: cqst
   "It's a little too much sometimes. You gotta calm down your work too, Conquest." {deathMet: Death responds.| answered a skull-faced man.} #CLASS: dth
   
   ~ deathMet = true
   ~ conquestMet = true
   ~ poliFlag = true
   ~startFlags+= 1
   
   ->startOpts1
   
   ~ poliFlag = true
   ~ startFlags +=1
  

*{gangsFlag} 'He?'
bar #CLASS: bar
    "He? Oh yeah, greed. The Seven Deadly are real, you know. Watch the other rings for 'ol Lucy." {deathMet: Death responds| answered a skull-faced man.} #CLASS: dth
    ~ lucyMet = true
    "I don't know how many times I've asked you to not call me that, Death." #CLASS: lcfr
    "Not sure how you couldn't have guessed it. I mean, we're right in front of you too." {deathMet: Death responds| answered a skull-faced man, clearly the one referred to as "Death".} #CLASS: dth
    ~ famineMet = true
    ~ deathMet = true
    ~sevenDeadlyKnow = true
    ~ startFlags += 1
    ** [Fair point]
        'Fair point.'
        ->startOpts2

/////////////////////////////////////////////////////   Version 2 - After 2 tangents   /////////////////////////////////////////////////////
- (startOpts2)
*{not gangsFlag} 'Gangs'
bar #CLASS: bar
    Like the mafias, crips, bloods, all that?
    
    "I mean, it sucks. People doing terrible things in pursuit of Greed. He isn't even the coolest one. However, {startFlags < 1: It is a grey area. Some do it to protect those they love. Others seek to hurt | as with all your questions, the matter is grey.}" {lucyMet: Lucifer replies. | the reverbating voice replied.} #CLASS: lcfr
    ~ gangsFlag = true
    ~ startFlags +=1
    -> startOpts2

*{not drugsFlag} 'Drugs'
bar #CLASS: bar
    "In general? I think they're fine. A natural consequence of nature. However, {startFlags < 1: It is a grey area. Some do it to protect those they love. Others seek to hurt | as with all your questions, the matter is grey.}" {lucyMet: Lucifer replies. | the reverbating voice replied.} #CLASS: lcfr
    "Crack gives birth to the warrior inside. You could stand to take advantage of such." {warMet: War adds in. | another man with large muscles adds.} #CLASS: war
    "I prefer the opiods a bit more, but War has a point. Warriors give lead to domination." {conquestMet: Conquest announces. | entered a man with fancy clothes.} #CLASS: cqst
    
    ~ warMet = true
    ~ drugsFlag = true
    ~ startFlags +=1
    -> startOpts2

*{not poliFlag} 'Politicians'
bar #CLASS: bar
   "You need a special kind of narcissim to go into politics." {lucyMet: Lucifer replies. | the reverbating voice replied.} #CLASS: lcfr
   "Most are fine. They seek to improve the lives of those they represent. Others? Their actions lead many to suffer callously, and muddy the name of those who mean good. Keeps Death busy, however." {conquestMet: Conquest announces. | entered a man with fancy clothes.} #CLASS: cqst
   "Maybe a little too busy. You have to calm down, Conquest." {deathMet: Death responds.| answered a skull-faced man.} #CLASS: dth
   ~ deathMet = true
   ~ conquestMet = true
   ~startFlags+= 1
   ->startOpts1
   
   ~ poliFlag = true
   ~ startFlags +=1
  
*{gangsFlag && not sevenDeadlyKnow} 'Who's he?'
bar #CLASS: bar
    "He? Oh yeah, Greed. The Seven Deadly are real, you know. Watch the other rings for 'ol Lucy." {deathMet: Death responds| answered a skull-faced man.} #CLASS: dth
    "I don't know how many times I've asked you to not call me that, Death." #CLASS: lcfr
    "Not sure how you couldn't have guessed it. I mean, we're right in front of you too." {deathMet: Death responds| answered a skull-faced man, clearly the one referred to as "Death".} #CLASS: dth
    ~ lucyMet = true
    ~ deathMet = true
    ~ startFlags += 1
    ** [Fair point]
        'Fair point.'
    ->startOpts2

*{startFlags >= 2} [Mention their names]
bar #CLASS: bar
    'You guys have some odd names.'
   "We existed long before you all arrived," snapped War, "Our purpose and lives cannot be compared to that of a human." #CLASS: war
    **[Ask further]
        'So you are the cause of your namesake? Is that your purpose?'
        "That's all you people. Our names our merely coincidence." {conquestMet: Conquest announces. | entered a man with fancy clothes.} #CLASS: cqst
        "Do not blame us for your choice to live." Famine proclaims, against his outwardly frail and meek nature. #CLASS: fmn
        "I think I'm from you actually. I mean, why a human skeleton of all boney creatures?" {deathMet: Death responds| answered a skull-faced man.} #CLASS: dth
        ->session2
    **[Let it pass]
        'Interesting. I wonder how humans learned your names so exact.'
        
        The table's various faces look around aimlessly, seemingly avoiding the conjecture of how they might know.
        ~ theirNames = true
        ->session2
    
*{not startFlags < 2} Continue
    "Next card already, War." Death says. #CLASS: dth
    "I told you I did not want to be the dealer." #CLASS: war
    The large and built man attempts to flip a card in the river, but slips his fingers enough to send it flying off the table and sliding over the ice.
    "War, c'mon mate!"
    ~ warMet = true
    ~contFlag1 = false
    "I told you, I shouldn't have been dealer!" He booms, standing out of his chair with strength. #CLASS: war
     Death holds his armrest opposite of War, bracing in case War decides to scream some more. Famine, directly across from him, promptly sits up in attention. Conquest and Lucifer simply give him a scolding look. War stares back and goes to retrieve the card and now sliding chair. Death leans towards you, 
     "Kind of embarassing, am I right. Sorry about him, mate. He just has a bit anger issues." #CLASS: dth
    ~ famineMet = true
    ->session2

=== session2 ===
     bar #CLASS: bar
    
    You've been here for hours at this point and have not felt a need to ask
    'Why?' you blurt out.
    The table's attention is drawn towards you now. "Why what?"
    
    *Continue asking
        'Why am I here? I just figured nows the time to ask. This isn't exactly what I pictured when people told me I was going to Hell.'
        "Well you of all should know. You appeared at the table just a bit ago. We expected you to know what you were doing, especially after just jumping into our poker game." Lucifer tells you. #CLASS: lcfr
        Your memories are still a haze. You do remember wanting to play poker simply because it was there, as if you were meant to relax. But your origins are lost within yourself.
        ~lucifer += 1
        ~askFlag = true
        ->session3p1
    *[Play it off]
    
    **The Four Horseman
        'Why are you all on the lake? It does not seem easy to get it.'
        "Oh, it isn't. It took us quite a few days to dig in." Famine says. #CLASS: fmn
        "Like you did any of the digging. You spent most of it complaining and slugging along." War responds. #CLASS: war
        "At least I helped." #CLASS: fmn
        'Wait, if it was sealed why dig in?'
        "We couldn't leave Lucy alone forever, now could we?" Death says. #CLASS: dth
        ->session3p1
        
    **The lake
    'Why's the whole area covered in ice?'
    Lucifer straightens his back out, as much as a large red human could with half their body in ice. The table clutches their cards tight as enormous leathery wings flap out from behind him, sending a large gust of wind through the whole ice cage. The wind nearly blows down Famine, and Death's cards are blown out of his bony hands.
    #IMAGE: img/lucifer.png
    "Damn, Lucy! A little too hard, my cards are flown!" He scrambles after his cards in the wind. #CLASS: dth
    "Apologies for my theatrics, Death. They asked and I owe an explanation. When I was sent to Hell, I fell into Cocytus. When I tried to fly out, my wings only froze the lake. In fear, I lost myself and kept flapping trying to climb out. For so long I tried to fly and only created this cocoon of ice." Lucifer says, with a heavy shame. #CLASS: lcfr
    ~lucifer += 1
    ~coolGuyFlag = true
    ->session3p1
    
    *'Nothing'
    The table fidgets in a short silence.
    "If you believe so. I assure you however, we do not mind questioning." Lucifer says. #CLASS: lcfr
    ~awkwardFlag = true
    -> session2Not
    
=== session2Not ===
    *Continue asking
        'Why am I here? I just figured nows the time to ask. This isn't exactly what I pictured when people told me I was going to Hell.'
        "Well you of all should know. You appeared at the table just a bit ago. We expected you to know what you were doing, especially after just jumping into our poker game." Lucifer tells you. #CLASS: lcfr
        Your memories are still a haze. You do remember wanting to play poker simply because it was there, as if you were meant to relax. But your origins are lost within, almost purposefully.
        ~lucifer += 1
         ~askFlag = true
        ->session3p1
   
    
    
    *[Play it off]
    
    **The Four Horseman
        'Why are you all on the lake? It does not seem easy to get it.'
        "Oh, it isn't. It took us quite a few days to dig in." Famine says. #CLASS: fmn
        "Like you did any of the digging. You spent most of it complaining and slugging along." War responds. #CLASS: war
        "At least I helped." #CLASS: fmn
        'Wait, if it was sealed why dig in?'
        "We couldn't leave Lucy alone forever, now could we?" Death says. #CLASS: dth
        ->session3p1
        
    **The lake
    'Why's the whole area covered in ice?'
    Lucifer straightens his back out, as much as a large red human could with half their body in ice. The table clutches their cards tight as enormous leathery wings flap out from behind him, sending a large gust of wind through the whole ice cage. The wind nearly blows down Famine, and Death's cards are blown out of his bony hands.
    #IMAGE: img/lucifer.png
    "Damn, Lucy! A little too hard, my cards are flown!" He scrambles after his cards in the wind. #CLASS: dth
    "Apologies for my theatrics, Death. They asked and I owe an explanation. When I was sent to Hell, I fell into Cocytus. When I tried to fly out, my wings only froze the lake. In fear, I lost myself and kept flapping trying to climb out. For so long I tried to fly and only created this cocoon of ice." Lucifer says, with a heavy shame. #CLASS: lcfr
    ~lucifer += 1
    ~coolGuyFlag = true
    -> session3p1
    
    *'It's really nothing. Slip of the tongue.'
    "If you say so."
    ~lucifer -= 1
    ->session3p1
    
=== session3p1===
    bar #CLASS: bar
    Everyone continues playing cards in general silence. A few yesses and noes are exclaimed, but not much conversation.
    *Learn about yourself
    'Last I remember of my mortal life, I was'
    **'at the park.'
        "Enjoying a lovely stroll, eh?" Conquest jests. #CLASS: cqst
        ~park = true
        ~youFlag = false
        ***Yes
            'Why yes I was. It was a nice day off work that I took for myself.'
            Lucifer, for the first time, contributes in a casual manner, "I had loved walking under that Earthly sun. The heat is cast soothed me. Sweaty to an ungodly extent... maybe I shouldn't say ungodly." 
            The table chuckles a bit at his moment of openness.
            ~lucifer += 1
            'It was good, but I just felt dizzy. My mind was screaming not to, but my body simply laid out onto the ground.'
            ->session3p2
        ***No 
            'Well no actually. It was a sad day, a lonely one. My partner had left me, and my friends too. Said I never cared enough.'
            "Bollocks!" Death exclaims, "You've been a perfectly lovely guest at our table! I'd love to have you around." #CLASS: dth
            The table nods and mumbles in agreement.
            'It was good, but I just felt dizzy. My mind was screaming not to, but my body simply laid out onto the ground.'
            ->session3p2
        
    **'at a party'
        "Partaking in a victory I assume?" War jests. #CLASS: war
        ~party = true
        ~youFlag = false
        ***Yes
            'A fantastic victory. I had finally gotten a job in the career I studied for. It took a long time, but I had finally made it. I got carried away in my self-celebration. I had thought myself sober enough to drive home, but clearly I was not.'
            ->session3p2
            
        ***No
            'Not really. It felt like an act. Wanting to show I was popular. From there, I had thought myself sober enough to drive home, but clearly I was not.'
            ->session3p2
        
    **'working'
        'I was spending the day working. Crunching numbers in a small office. I had wished to go to the park, but duty had called for me.'
        "Putting in the hours for your community. A noble work." Conquest proclaims. #CLASS: cqst
        ~work = true
        ~youFlag = false
        ***Yes 
        'I'm glad you think so. I tried my best to help small companies with their finances. It took up a lot of my time, almost too much.'
            You remember your friends and family, and the neglect they felt as you were consumed by your work alone.
        ->session3p2
        ***No
            'Not exactly. I was just an accountant working for a large company. I gave people their paychecks, but I would not call it noble.'
            Conquest counters such notion, 
            "Any work is a service for someone. I cannot imagine you doing work you did not believe in." #CLASS: cqst
            Despite his beliefs, it was not. Being forced to lie and write wrong reciepts to back up a large company is not noble.
            ->session3p2
    *[Question the others]
        'What about you guys.'
        "What do you mean?" Famine asks. #CLASS: fmn
        'Well where did you guys come from. Like
        ->lineOfQuestioning
    ~tableFlag = false
    ->session3p2
    
    
=== session3p2 ===
    *{youFlag} Learn about yourself
        "Since you have mentioned it, I feel I must ask. Why do you think you are here?" #CLASS:lcfr
        'Last I remember of my mortal life, I was'
    **'at the park.'
        "Enjoying a lovely stroll, eh?" Conquest jests. #CLASS: cqst
        ~park = true
        ~youFlag = false
        ***Yes
            'Why yes I was. It was a nice day off work that I took for myself.'
            Lucifer, for the first time, contributes in a casual manner, "I had loved walking under that Earthly sun. The heat is cast soothed me. Sweaty to an ungodly extent... maybe I shouldn't say ungodly." 
            The table chuckles a bit at his moment of openness.
            ~lucifer += 1
            'It was good, but I just felt dizzy. My mind was screaming not to, but my body simply laid out onto the ground.'
            ->lineOfQuestioning
            
        ***No 
            'Well no actually. It was a sad day, a lonely one. My partner had left me, and my friends too. Said I never cared enough.'
            "Bollocks!" Death exclaims, "You've been a perfectly lovely guest at our table! I'd love to have you around." #CLASS: dth
            The table nods and mumbles in agreement.
            'It was good, but I just felt dizzy. My mind was screaming not to, but my body simply laid out onto the ground.'
            ->lineOfQuestioning
        
    **'at a party'
        "Partaking in a victory I assume?" War jests. #CLASS: war
        ~party = true
        ~youFlag = false
        ***Yes
            'A fantastic victory. I had finally gotten a job in the career I studied for. It took a long time, but I had finally made it. I got carried away in my self-celebration. I had thought myself sober enough to drive home, but clearly I was not.'
            ->lineOfQuestioning
        ***No
            'Not really. It felt like an act. Wanting to show I was popular. From there, I had thought myself sober enough to drive home, but clearly I was not.'
            ->lineOfQuestioning
        The only vision you can grab is the flashing of lights and a jolt of force knocking you back, just before you popped in front of this very table.
        ->lineOfQuestioning
        
    **'working'
        'I was spending the day working. Crunching numbers in a small office. I had wished to go to the park, but duty had called for me.'
        "Putting in the hours for your community. A noble work." Conquest proclaims. #CLASS: cqst
        ~work = true
        ~youFlag = false
        ***Yes 
            'I'm glad you think so. I tried my best to help small companies with their finances. It took up a lot of my time, almost too much.'
            You remember your friends and family, and the neglect they felt as you were consumed by your work alone.
        ->lineOfQuestioning
        ***No
            'Not exactly. I was just an accountant working for a large company. I gave people their paychecks, but I would not call it noble.'
            Conquest counters such notion, 
            "Any work is a service for someone. I cannot imagine you doing work you did not believe in." #CLASS: cqst
            Despite his beliefs, it was not. Being forced to lie and write wrong reciepts to back up a large company is not noble.
            
            ->lineOfQuestioning
    *{tableFlag} [Question the others]
        'What about you guys.'
        "What do you mean?" Famine asks. #CLASS: fmn
        'Well where did you guys come from. Like <>
        ->lineOfQuestioning
        
    *{tableFlag || youFlag} [Continue]
        ->luciferQ1
        
        
=== lineOfQuestioning ===
    {themCount != 0:'Alright, but what about you | }
    *{deathFlag} [Death]
        Death
        bar #CLASS: bar
        #IMAGE: img/death.jpg
        **Continue
        {themCount == 0 && theirNames:"Well we've already told ya, each of us ain't from where you are." |} #CLASS: dth
        {themCount == 0:"Well you do know we ain't from Earth. Came right of the void, you could say."|} #CLASS: dth
         {themCount == 0:'Well, what would you be if you were human?' |}
         {themCount == 0:The table was shocked by this line of questioning. Them, concepts and immortals, questioned what if they were humans. | }
        "Well, if I had to choose. A plague doctor during the Black Death. Quite fitting, and I can tell I'd be ravishing in that outfit." #CLASS: dth
        ~themCount += 1
        ->lineOfQuestioning
    
    *{warFlag} [War]
        War
        bar #CLASS: bar
        #IMAGE: img/war.jpg
        **Continue
        {themCount == 0 && theirNames:"We have already informed you that our origins are divine."|} #CLASS: war
        
        {themCount == 0: "We existed long before you all arrived," snapped War, "Our purpose and lives cannot be compared to that of a human." |} #CLASS: war
        
         {themCount == 0:'Well, what would you be if you were human?' |}
         
         {themCount == 0:The table was shocked by this line of questioning. Them, concepts and immortals, questioned what if they were humans. | }
            "Obviously a warrior of Sparta." #CLASS: war
            
            'Not king?'
            War laughs heartily at the notion.
            "Too noble for someone like me. I deserve front row seats." #CLASS: war
        ~themCount += 1
        ->lineOfQuestioning
    
    *{conquestFlag} [Conquest]
        Conquest
        bar #CLASS: bar
        #IMAGE: img/conquest.jpg
        **Continue
        {themCount == 0 && theirNames: "I think we have already mentioned that we are not of your kind nor world."|} #CLASS: cqst
        {themCount == 0:"Oh that is funny. You must know that we are not of your kind nor world."|} #CLASS: cqst
        {themCount == 0:'I understand, but what if you were a human?' |}
        {themCount == 0:The table was shocked by this line of questioning. Them, concepts and immortals, questioned what if they were humans. | }
            "{warFlag:Unlike War, |}I would be king of a great empire, no the best empire, which is obviously Old Britain." #CLASS: cqst
            ~themCount += 1
            ->lineOfQuestioning
    
    *{famineFlag} [Famine]
        Famine
        bar #CLASS: bar
        #IMAGE: img/famine.jpg
        {themCount == 0 && theirNames: "I believe War has told you before that we didn't come from Earth."|} #CLASS: fmn
        {themCount == 0:"Oh bother, we haven't told you. We aren't human, we never were. Just cosmic and divine creations."|} #CLASS: fmn
        {themCount == 0:'I get it, don't worry. But what if you were human?' |}
        {themCount == 0:The table was shocked by this line of questioning. Them, concepts and immortals, questioned what if they were humans. | }
        "I'd like to be in modern America.{conquestFlag: While Conquest may not know about the world wars, I would mind being around that time period.|} Modern America has all the food I could possibly eat." #CLASS: fmn
        ~themCount += 1
        ->lineOfQuestioning
    
    *{themCount >= 2} [Continue]
        ->luciferQ2
    ->luciferQ2
    
=== luciferQ1 ===
    'What about you, Lucifer? I never really was a Bible reader, so what happened to you.'  
->lucifersOrigin

=== luciferQ2 ===
    Lucifer? I never really was a Bible reader, so what happened to you.'
    
->lucifersOrigin

=== lucifersOrigin ===
bar #CLASS: bar
    Lucifer hunched slightly, lowering his strong demeanor.
    "I was one of God's angel, one of his closest council, tasked with tempting humans to test their faith. Tell me, have you at least heard of Job?" #CLASS: lcfr
    
    *Yes
    'The shepard?'
    "Yes. The shepard. It's a deep regret I hold. A worthless venture, which brought nothing but misery upon a poor man." #CLASS: lcfr
    Lucifer tightens his grip, filled with anger and shame. "I hurt that man for no reason other than selfish pride, and it's that same pride which cast me down to this pit of nothing." #CLASS: lcfr
    
    **Continue
    "I thought I knew better than God, mislead and tricked by peers against him. He saw into my heart and cast me out of Heaven, beside the people I had tricked. They suffered the same as Job, for my selfish pride." #CLASS: lcfr
    He leans forward, looking down at the ice, resting his head upon his hand.
    
    
    *No
    'No, I haven't.'
    bar #CLASS: bar
    Lucifer's deep leathery voice spoke, "Job was a shepard, caring for his large family. I despised the man. I believed him a man faithful only for the good fortune life had brought him. I spoke to the Lord and he told me I could test him," #CLASS: lcfr
    Lucifer silences himself for a second, before cobbling together the words, 
    "I killed his family. I took his land, his cattle, his crop. And through it all he still believed in the Lord." #CLASS: lcfr
    Lucifer tightens his grip, filled with anger and shame. 
    "I hurt a man for no reason other than selfish pride, and it's that same pride which cast me down to this pit of nothing." #CLASS: lcfr
    ~Job = true
    
    **Continue
    "I thought I knew better than God, mislead and tricked by peers against him. He saw into my heart and cast me out of Heaven, beside the people I had tricked. They suffered the same as Job, for my selfish pride." #CLASS: lcfr
    He leans forward, looking down at the ice, resting his head upon his hand.
    -
    
    
    *{lucifer >= 2} 'Do you regret it?'
        {luciferFirstTime: ->lucifer1 | ->lucifer2 }
    *Origins.
        'Do you think God will forgive you?'
        Lucifer lifts his head from his plams,
        "I do not believe so. And even if He did, He would not hear it from down here." #CLASS: lcfr
        As he says this, you imagine a grandious situation. A soul, one selfish and prideful, dies on Earth. Maybe God could learn of Lucifer's potential shame.
        Silence fills the table, a situation too heavy to interupt for the inhabitants, but not for Him. Light busts through the ice, surrounding your body as you slowly float and shoot into the air, the table looking confused.
        
        ~luciferFirstTime = false
        ->godTalkReveal
    
    *{lucifer >= 3} Continue for Compassion.
        Now is not the time to pry.
        'Conquest. Can you deal us up some more cards.'
        "Of course."  #CLASS: cqst
        Conquest reshuffles the deck, passes each person 3 cards and the deck is placed back on to the table.
        The table of five becomes six as you decide to stay. Though he will not say, perhaps he is regretful of what he has done. To you, it matters not his past, as it's everyone's future you care about.
    ->END
    *Continue.
        Now is not the time to pry.
        'Conquest. Can you deal us up some more cards.'
        "Of course." #CLASS: cqst
        Conquest reshuffles the deck, passes each person 3 cards and the deck is placed back on to the table.
        The table of five becomes six as you decide to stay. Though he will not say, perhaps he is regretful. There will be plenty of time to find out in Hell.
        ~lucifer += 1
        ~luciferFirstTime = false
        
        **{lucifer >= 2} 'Do you regret it?'
        {luciferFirstTime: ->lucifer1 | ->lucifer2 }
        ->END
    
        
=== godTalkRegret ===
    bar #CLASS: bar
    "You have done well my son." #CLASS: god
    A disembodied voice speaks. It's soothing to incomprehensible amount.
    'What have I done?' you reply.
    "You have gotten Lucifer to confess, and for such I thank you. I had hoped he would be regretful in the least, but.. I suppose he does not fully. Despite his relentlessness, I offer you a boon. Rebirth, Heaven, or Hell. I shall grant you any of these my son." #CLASS: god
    ->godTalkChoices
    
=== godTalkReveal ===
    bar #CLASS: bar
    "Not exactly my hopes."#CLASS: god
    A disembodied voice speaks. It's dissapointment is overshadowed by its inherent smooth quality, of which the full extent is incomprehensible amount.
    'I apologize, God. I know not how I failed you, and not how I would succeed you.'
    "You were meant to coax his confession, his regret. I want desperately for him to be by my side, yet he refuses to truly feel shame."
    *Listen
    "You have tried, for that I do not blame you. I sahll still offer you a boon. Rebirth, Heaven, or Hell. I shall grant you any of these my son." #CLASS: god
    ->godTalkChoices
    
    *Confront
    'Shame and regret are not the same.'
    The light shining upon you dims slightly, 
    "What ever do you mean?" #CLASS: god
    the voice says.
    'He wouldn't change his motives, that much is true. However, he feels a deep shame for the souls around him he doomed.' 
    You say, feeling a pinch of irony and realization. The general light is dim, but a point begins to form of a bright yellow. 
    "If you believe so, then you can just stay with him." #CLASS: god
    ->backToHell
    
    ->END
=== godTalkChoices ===
    *Rebirth
    A new life and another chance to care for others.
    "And so it shall be." #CLASS: god
    A bolt of lightning strikes you as your soul plummets to back the Earth {park:onto the ground where you fell. You have been unseen as of yet, but your phone is filled with notifications, begging for your attention. Perhaps you have a second chance.|}{work:into your body as you're being carried into an ambulance. A mix of gasps and shouts come from the crowd gathered around the building which commanded you.|}{party:to a cold metal slab, various doctors surrounding your once unconscious body. Time to try again.|}
    ->END
    
    *Heaven
    Eternal life and happiness, how could anyone say no.
    Your soul floats against fluffy white clouds to a bright golden gate, which opens in your path. You'll be happy here. You just feel it.
    ->END
    
    *Hell
    You do not need to answer, fore God sees into your heart and knows your intention. The comfort this light brings dims a little.
    "I see your attachment. If it is your true will, then it shall be yours." #CLASS: god
    bar #CLASS: bar
    A brilliant light shines above you and strikes you down.
   ->backToHell
  
=== lucifer1 ===
    Lucifer lifts his head, "I cannot say. My beliefs were nothing but hubris and my actions were evil. Lying and trickery are not ways to gain allies, and I let my desires overpower the goodness in my heart. But as {Job:I have shown you, I am not one to back down from my beliefs. |you know, I am not one to relent.} Even if I am not on the throne upon Mount Zaphon, God's will should not be the only will." #CLASS: lcfr
        ->godTalkRegret

=== lucifer2 ===
    The question shakes Lucifer a bit, he had thought the notion long past. 
    "I cannot say. My beliefs were nothing but hubris and my actions were evil. Lying and trickery are not ways to gain allies, and I let my desires overpower the goodness in my heart. But as {Job:I have shown you, I am not one to back down from my beliefs. |you know, I am not one to relent.} Even if I am not on the throne upon Mount Zaphon, God's will should not be the only will." #CLASS: lcfr
-> godTalkRegret

=== backToHell ===
bar #CLASS: bar
  Through the Earth, past the seven hells, and through Cocytus' icey roof. The table jolts and watches you shatter through the ceiling and fall to the cold cold ice.
    *'Hello again'
    The table is confused, yet visibly escatic at your arrival. Famine and War come and assist you from the dented ice, while Conquest proudly watches on and Death's lower jaw lays on the ground. War walks you back to your seat while Famine attempts to help. You wince as you take your seat befor saying 'Conquest, can you deal us some more cards?'
    "Of course!" #CLASS: cqst
    Conquest reshuffles the deck, passes each person 3 cards and the deck is placed back on to the table.
        The table of five becomes six as you decide to stay. Though he will not say, perhaps he is regretful. To you, it matters not his past, as it's everyone's future you care about.
    ->END
    *Walk to the table
    You lift yourself from the icey floor and walk back to the table. War looks on in confusion, Conquest peers unfazed, Death's lower jaw has fallen off, Famine grows a smile and Lucifer simply watches. You take your seat.
    'Conquest, can you deal us some more cards?'
    "Of course!" #CLASS: cqst
    Conquest reshuffles the deck, passes each person 3 cards and the deck is placed back on to the table.
        The table of five becomes six as you decide to stay. Though he will not say, perhaps he is regretful. To you, it matters not his past, as it's everyone's future you care about.
->END
=== END ===
The end.
->DONE