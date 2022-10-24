# Musicapp
![thumbnail](https://user-images.githubusercontent.com/49677462/197556263-5d91a375-c134-4892-ac06-e730e3416d30.png)

A **playground app** created for the WWDC22 student challenge. <br>
The Playground is an **interactive experience** where the user can freely **play** on the music pad, <br>
combining multiple sounds together at the same time, or **listen** to (and then try to replicate) different songs. <br>
It also conveys how notes of different pitches are represented in music notation showing them on a music staff.

## Technologies
Everything starts from a recording of a single note (for each instrument), modifying its pitch with **AVFoundation** to cover all of the instrument’s playable spectrum.
This allows for great versatility when playing different notes, without needing more recordings. <br><br>

For the **music staff**, I’ve placed an imaginary origin point in its middle, since notes can be placed indefinitely far toward the top or bottom. <br> 
Notes are dynamically drawn with **shapes** and placed with an **offset** based on their pitch, which is a combination of the note’s name and octave 
(since in music 7 notes always repeat, the octave is like an index of repetition to identify the exact note referring to).<br><br>

This whole system can be used to display or play whatever set of notes at will. <br>
Everything is created using **Swift, SwiftUI,** and **AVFoundation**; and the audio files were played and recorded by myself.

## Demo

https://user-images.githubusercontent.com/49677462/197556840-fc108c5c-16d6-446e-93a8-2dc21301f3cd.mov

![image](https://user-images.githubusercontent.com/49677462/197564049-78653897-1e5d-48c6-89d1-c31be3fc26bd.png)
