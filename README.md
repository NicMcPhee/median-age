# median-age

A simple script to compute the median age of each line of a file based on its `git` commits. We're going to poke 
at this as a group exercise in CSci 4659 (Software Quality) in response to an exercise at the
end of Chapter 5 (p. 89) of Adam Tornhill's _Software Design X-Rays_.

The problem description from Tornhill:

> So far in the book we’ve used variations on the git log command for our data mining. That strategy works 
> surprisingly well in providing us with the bulk of information we need. But for more specific analyses we need to dig deeper.
>
> One such analysis is a possible extension to the age analysis in this chapter, where we used a shallow measure for code age. 
> Ideally, we’d like to complement our age metric with a second one that goes deeper. One promising possibility is to calculate 
> the median age of the lines of code inside a file. A median code age value would be much less sensitive to small changes and 
> likely to provide a more accurate picture. How would you calculate the median age of code?
>
> Hint: The key to successful data mining is to have someone else do the job for us. Thus, look to outsource the bulk of the 
> job to some of Git’s command-line tools that operate on individual files. There are multiple solutions.

There's also a hint in Appendix 4:

> To calculate a median value, we need to get the age of each individual line of code. This sounds like a job for
> `git blame`. We could even add the `--porcelain` option to make it easier to consume the output.
