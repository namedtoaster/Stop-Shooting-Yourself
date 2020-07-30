extends Node

# Dialog
var intro = ["Hello, my name is Kort!",
"You are here because you volunteered to test some new equipment!",
"Here is the gun that you will be testing",
"All you have to do is make it through each level by killing as many simulated enemies as possible!",
"Just remember, you ARE testing the gun. So there may be some issues...",
"Most notably, this particular model seems to...aim in the wrong direction",
"...you'll see what I mean",
"Anyway, good luck, and don't...*cough*...don't shoot yourself...",
"."]

var level_1 = ["Congratualations! You made it to this level!",
"I'm actually...kind of surprised...",
"Er...good job! Keep up the good work!",
"At the end of the last level, you captured a gear",
"That gear is supposed to be a new piece to test in the gun",
"We'll see if it did anything during this test!",
"."]

var level_2 = ["Well looks like the gears aren't doing anything...surprise",
"Just...just keep testing please",
"I don't know what's happening...",
"All the other test subjects kept dying, now the gears aren't working",
"I probably shouldn't have told you that...",
"."]

var level_3 = ["OK nothing works. I give up",
"Just try not to die anymore...",
"."]

var end = ["Well, that's pretty much it. I guess you completed the testing.",
"The gun seems to still be broken, so uh thanks for nothin",
"Sorry, this whole testing is driving me nuts, nothing personal",
"Anyway, thanks for testing. I guess we still have to keep working on improvements",
"But that's all we could do for now. Hope you had fun..."]

var dialog = intro


# Called when the node enters the scene tree for the first time.
func _ready():
	print("dialog")
