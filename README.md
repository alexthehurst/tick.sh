# tick

Created by Alex Hurst in 2015-2016.

Tick is a nimble shell script for helping you keep yourself on task. It's designed to require very few keystrokes to use. Start a timer with tick, and it will quietly count down. When it reaches zero, tick will send you an Applescript notification, and start counting up your overtime. When you end the task by interrupting with ^C, you'll be prompted for an optional note. Stats about the task will be logged in a csv file at ~/ticklog, for later analysis if you're interested.

Tick should be useful for any productivity system that involves timing, especially the Pomodoro Method. and Getting Things Done's 2-minute limit for processing an incoming item before sending it to the inbox. The count-up feature also makes it easily adaptible for simple time tracking. All you have to do is set a 0-second timer with `tick.sh 0` (or with the recommended alias, `t 0`).

# Usage

## Starting a timer

`tick [time] [taskname]`

- `tick`: Start an unnamed countdown timer for the default 2 minutes. At the end of the countdown, start counting up.
- `tick [time]`: If the first word is a valid time format, tick will use that as the countdown timer instead of the default. Supported time formats are:
    - `90`: Any non-negative number will be interpreted as a count of seconds.
    - `45s`: A number of seconds.
    - `15m`: A number of minutes.
    - `2h`: A number of hours.
- `tick [taskname]`: The task will be given this name.

## Stopping the timer

Use `^C` to stop the timer. You'll be dropped into a prompt for any notes you want to make about the task. (Mine are usually along the lines of, "Ran long because of <interruption x>"). If you don't want to log the task, just type "del". If you don't care to make a note, simply hit return and tick will get out of your way.

## Installation

You can run tick.sh from any location. Wherever you save it, I recommend adding it to your path and aliasing `t` for `tick.sh` and `r` for `review.sh`, for two-keystroke timer-starting. You can set this up automatically by running `setup.sh` from the tick directory.

## Usage tips

- In most task managers, you'll be able to copy task names as a line of text. If your tasks are formatted with a time estimate up front (like "15m write the best email ever"), then you can just copy that line, head to your console, and type t-space-paste to get your timer started.
- In many task managers (including OmniFocus and any text-based ones like taskpaper and todo.sh), you'll be able to copy out a list of tasks. This makes it easy to drop the list into SublimeText, sandwich each line with "t " and " &&", and then paste the whole chunk to get a chain of timers all queued up.
- `review.sh` is a little convenience script for kicking off a loop of quick reviews. Invoke it with "`review.sh <number>`" and it'll start that many 2-minute timers in sequence, named "Quick review <i> of <n>". I find this useful for keeping myself focused on triaging email.


