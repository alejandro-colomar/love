This is a fun project, written in a morning during the Smart Manufacturing
and Robotics Delft Minor <https://www.robotminor.nl/>.

It is a demonstrator of how powerful the code in my libalx library
<http://www.alejandro-colomar.es/libalx/> is.

The history behind this is that I hated both the GUI and the scripting
language that the robot (a Universal Robots UR-5) used.  So that morning
we had a bit of free time, and I decided to intercept the communications
between that GUI and the robot.  I found out that it was using very simple
TCP messages, which I tried to replicate with telnet.

On the first attemnpt I got a succesful login, and a message printed on
the screen of the robot; great!  Then I tried sending as plain text some
of the commands that we learnt in that Python-based scripting language;
I moved the robot!  And just after a few minutes!

Then I had a call with a friend of mine in Spain, and I told her about what
I was doing with the robot.  She asked me to come up with something nice.
And so I decided to write a heart for her :).  I wrote a library interfacing
the basic movement commands of the robot to a set of simple C functions
in a copule of hours, got the coordinates of a few points in the whiteboard
next to the robot, wrote a program to move the robot to those points in
a few minutes (thanks to the simplicity of the library I wrote just before),
and the most difficult part: sticked a pen to the hand of the robot.

Then I run the code, the results of which are in the video
<http://www.alejandro-colomar.es/usr/share/videos/20200221_love_c.mp4>.
Great morning of hacking!
