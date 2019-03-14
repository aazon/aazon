---
title: "Empty directories in git repository"
date: 2019-03-11T23:38:38+01:00
tags: ["git", "how-to"]
description: >
    Creating empty directories in git repository is a daily business task and everybody did it a few times.
    The example from real life may be a directory for cache, logs, build artifacts etc.
    There are two different ways how to get the result: creating a `.gitignore` with a specific content or creating
    an empty file, usually `.gitkeep` in the directory. I will explain why the latter approach is better.

---

Creating empty directories in git repository is a daily business task and everybody did it a few times.
The example from real life may be a directory for cache, logs, build artifacts etc.
There are two different ways how to get the result: creating a `.gitignore` with a specific content or creating
an empty file, usually `.gitkeep` in the directory. I will explain why the latter approach is better.

The first approach is to create a `.gitignore` file with the following content:

```
# /path/to/the/directory/.gitignore
*
!.gitignore
```

According to [documentation](https://git-scm.com/docs/gitignore) git will process `.gitignore` moving from the root level
to nested directories and overriding rules that coincide.
In other words, the lowest `.gitignore` file in the directory will always win.

The downside of having a few `.gitignore` files in the project is that it gets harder to fetch the full list of
empty directories.
This may be especially a problem for the people who just started working on the project and don't know the codebase
well enough.

I find an approach with creating a `.gitkeep` to be more useful.
This approach allows having exactly one `.gitignore` file in the project with as many empty directories as needed.

There is one additional line that excludes `.gitignore` everywhere:

```
# .gitignore
!.gitkeep
```


To create an empty directory one needs to put an empty `.gitkeep` file in it:

```
$ mkdir -p /path/to/the/directory
$ touch /path/to/the/directory/.gitkeep
```

Then, add the directory in question to the `.gitignore`:

```
# .gitignore
!.gitkeep
/path/to/the/directory/*
```

Pay attention to the `*` at the end -- this will affect only files inside the directory but not the directory itself.
The trick is that `*` does not cover so-called dotfiles and ignores `.gitkeep`.
