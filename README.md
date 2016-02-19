# tick.sh

Created by Alex Hurst in 2015-2016.

Tick.sh is a nimble shell script to help you stay on task. It's designed to require very few keystrokes to use. Start a timer with tick.sh, and it will quietly count down. When it reaches zero, tick.sh will send you an Applescript notification, and start counting up your overtime. When you end the task by interrupting with Ctrl-C, you'll be prompted for an optional note. Stats about the task will be logged in a csv file at ~/ticklog.csv, for later analysis if you're interested.

Tick.sh should be useful within any productivity system that involves timing, especially the Pomodoro Method. It's well-suited for Getting Things Done as well, particularly processing inboxes with a 2-minute limit for either solving a task or seding it to your system. The count-up feature also makes it easily adaptible for simple time tracking. All you have to do is set a 0-second timer with `t 0`.

# Usage

## Installation

- You can run tick.sh from any location. Wherever you save it, I recommend adding it to your path and aliasing `t` for `tick.sh` and `tt` for `ticktick.sh`, for two-keystroke timer-starting. You can set this up automatically by running `setup.sh` from the tick directory. It will add instructions in your .bash_profile to update the path and variables.
- This guide assumes the reader is using the `t` and `tt` aliases.

## Starting a timer

`t [time] [taskname]`

- `t`: Start an unnamed countdown timer for the default 2 minutes. At the end of the countdown, start counting up.
- `t [time]`: If the first word is a valid time format, tick.sh will use that as the countdown timer instead of the default. Supported time formats are:
    - `90`: Any non-negative number will be interpreted as a count of seconds.
    - `45s`: A number of seconds.
    - `15m`: A number of minutes.
    - `2h`: A number of hours.
- `t [taskname]`: The task will be given this name.

### Starting a bunch of timers

`tt repetitions [time] [taskname]`

- `ticktick.sh` will simply repeat `tick.sh` the specified number of times, passing any remaining arguments straight through, and labeling the taskname with the repetition number, such as `[1/4]`.
- This is useful for repetitive tasks, like `tt 14 check an email`.
- With only a repetition count, `tt` will kick off the specified number of unnamed 2-minute timers.

## Stopping the timer

Use `^C` to stop the timer. You'll be dropped into a prompt for any notes you want to make about the task. (Mine are usually along the lines of, "Ran long because of < interruption x >"). If you don't want to log the task, just type "del". If you don't care to make a note, simply hit return and tick.sh will get out of your way and log the stats for the task.

## Usage tips

- In most task managers, you'll be able to copy task names as a line of text. If your tasks are formatted with a time estimate up front (like "15m write the best email ever"), then you can just copy that line, head to your console, and type t-space-paste to get your timer started.
- In many task managers (including OmniFocus and any text-based ones like taskpaper and todo.sh), you'll be able to copy out a list of tasks. This makes it easy to drop the list into SublimeText, sandwich each line with "t " and " &&", and then paste the whole chunk to get a chain of unique timers all queued up.
- Don't use this for timing anything that must be precise. The timing is a naive 1-second sleep loop which will surely run a little slower than actual time. This also means that it won't gracefully handle your computer going to sleep.
- This was developed in Bash on Mac OS X. Aside from using `osascript` to launch an Applescript, the rest of it should run fairly well in Bash on other Unixy systems, but it hasn't yet been tested.
