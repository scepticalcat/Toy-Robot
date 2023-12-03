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
### Docker
- `docker build . --tag no5`

### Native
- Ensure that Ruby ~> 3.2.0 is installed
- Run `bundle install`

## Running the Simulation
### Docker
- `docker run -ti -v ${PWD}:/No5 --rm --name no5 no5 run`

### Native
- `./bin/run`

## Running tests
### Docker
- `docker run -v ${PWD}:/No5 --rm --name no5 no5 quality`

### Native
- `./bin/quality`

Alternatively you can run the quality steps manually:
- `rspec`
- `rubocop`

## Limitations
Caveat, this was developed on a Windows machine and as such while the "native" or non-containerized installation and execution instructions are included, they have *not* been verified due to the nature of developing with Ruby on a Windows system and are there primarily as indicative documentation only.

Ordinarily I would leverage the I18N gem to remove hardcoded strings where practical. This makes testing more robust as I18N can be stubbed, allowing tests to ignore irrelevant copy changes, but more importantly it provides a standardised, predictable place for output strings to be stored.

I'm not sold on the command parser and the necessity of having to instantiate the commands as I would expect them to be static, but I wanted a somewhat self expanding interface and couldn't find a cleaner way of pre-applying the parsed arguments without forcing an outside class to bear resposibility for them.

To that end, including sufficient meta data within the commands themselves to allow the help text to be dynamically built is also an extention I would like to have made.

There are examples where a shared example group could have been used to reduce duplication, especially within the commands.
