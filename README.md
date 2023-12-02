## Description
This application is a simulation of a toy robot moving on a square tabletop.

## Requirements
- The table surface has dimensions of 5 units x 5 units
- There are no other obstructions on the table surface
- The robot is free to roam around the surface of the table, but must be prevented from falling
- The toy robot must not fall off the table during movement, this also includes the initial placement of the toy robot
- Commands that would cause the robot to fall should be ignored, subsequent valid commands must still be allowed
- Input can be from a file, or from standard input, as the developer chooses

### Commands
`PLACE X, Y, F`:
This will put the toy robot on the table in position `X,Y` and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should ignore all commands in the sequence until a valid `PLACE` command has been executed.
The origin (`0,0`) can be considered to be the `SOUTH WEST` most corner.

`MOVE`:
This will move the toy robot one unit forward in the direction it is currently facing.

`LEFT`, `RIGHT`:
These will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

`REPORT`:
This will announce the current position and facing; `X`,`Y` and `F` of the robot.

## Installation


## Running the Simulation


## Running tests
