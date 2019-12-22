# Parking lot problem

This is the solution to the parking lot problem by Go-Jek.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
* Start first with running this command first for initial setup:  *bin/setup*. This command runs tests and install all dependencies.
* Run *bin/parking_lot* to start the interactive console and pass an argument to the command if a file needs to be read and executed.
* Use command *exit* to exit interactive console.

### Prerequisites

What things you need to install the software

```
Ruby and bundle gem
```

## Running the tests

Local tests can be run by *rspec specs/lib*


### Project Structure

* The *lib* folder contains the classes.
* Tests are in *specs* folder.
* *main* file at the root contains the code to run the project.
* *bin* folder contains files for initial setup and bash file to call *main* file at the root.

## Built With
* [Ruby](https://www.ruby-lang.org/en/)

## Authors

* **Rahul Gautam** - (https://github.com/rahulgautam297)


## Issues:
  Fix these and then submit.

-Edge cases has not been handled
* Any invalid input results in program exiting with error.
* Running any command before create_parking_lot command results in error.
* Same car can be parked multiple times
 
- Test case for core logic, like parking to nearest available slot not present.

- I/O logic is part of the entity class itself where method prints result. It could have been extracted out and made part of I/O class.

- process_input and process_input_for_interactive could have been simplified to extract out common logic.
