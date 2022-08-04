# Rick and Morty API Scrape

<img src="https://cdn.brandfolder.io/JCJCW402/at/8pxm949wt5nksq95rwgm97g/morty.jpeg" alt="morty-aww-gee" style="width: 200px">

> Aww gee, we're not scraping data again are we Rick?

## What Is Your Purpose

<img src="https://cdn.brandfolder.io/JCJCW402/at/vm3xmrw7tb586p8swmtxt6/rick-and-morty-what-is-my-purpose-gif-2-2780069416.gif" alt="what is my purpose" style="width: 200px">

Collect data about Rick and Morty characters from the [Rick and Morty API](https://rickandmortyapi.com/documentation/#get-all-characters) and store them in a SQLite database.

Because we are on the intergallactic most wanted list, we wish to do so with haste by utilizing a multi-threaded architecture. Code must always be engaged in IO, we have no time to sit idly while pathetic network requests finish serially.

## DO IT MORTY

<img src="https://cdn.brandfolder.io/JCJCW402/at/sfbqwvz9j67zwgn3j5jjrb/rick-crazy.jpeg" alt="rick crazy" style="width: 200px">

> WHEN I RUN `bin/scrape` I BETTER GET A `database.sqlite` MORTY. I WANT THAT `database.sqlite` MORTY. MORTY YOU HAVE TO IMPLEMENT `bin/scrape` IT'S THE ONLY WAY WE'RE GOING TO GET A `database.sqlite`

## No wasted time

Imagine we are serially (one at a time) making web requests and writing response data to a file.

Each line in this graphic represents one of those loops, where `|` is the computer doing work, and `-` is the computer doing nothing:

```
[|||-------------------------------|||]
[----|||-----------------||||---------]
[--------------||---------------------]
...
[--|------|||------||-----------------]
```

We can streamline this process with Threads. Yes, even with Ruby! Our goal is to take the serial work above and turn it into this:

```
[|||||||||||||||||||||||||||||||||||||]
```

<img src="https://cdn.brandfolder.io/JCJCW402/at/sfbqwvz9j67zwgn3j5jjrb/rick-crazy.jpeg" alt="rick crazy" style="width: 200px">

> FILL IT WITH PIPES MORTY. MORTY WE NEED PIPES. WAKE UP MORTY, NO SLEEP MORTY.

### Parallelism vs Threads

Certain people will tell you "Ruby is slow", "There is no parallelism in Ruby", "The global interpreter lock (GIL) makes Ruby slow".

Rubbish. This dismissive viewpoint conflates parallelism with multi-threading.

Let's use a kitchen as an example. The process of cooking a meal involves a series of small tasks and some waiting around. Now, take these two example kitchens:

1. Five orders come in, five chefs cook each meal
1. Five orders come in, one chef cooks each meal

The first kitchen is our "true parallel" example-- there are five chefs to split the work. The second kitchen is more interesting, how do we make that not take 5x as long?

Well, the chef isn't going to just stand there while the mixer runs, they're going to start preparing something else. If they're really good at what they do, they can probably match the performance of the five chefs, or at least get close.

This is what multi-threading is vs. parallelism.

Of course, if each of the five chefs is just as good at multi-threading than the one chef, they're probably going to finish faster.

To bring it back to code, "I wrote this in Java so it's faster than your Ruby" is completely meaningless. Performance has nothing to do with language and everything to do with implementation, and Ruby Threads let us optimize workloads, even if it can only do one thing at a time (has one chef in the kitchen).

