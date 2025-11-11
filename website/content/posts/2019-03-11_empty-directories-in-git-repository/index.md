---
title: "Empty directories in Git repository"
date: 2019-03-11T23:38:38+01:00
layout: post
slug: empty-directories-in-git-repository
tags: ["git"]
description: >
    Creating empty directories in a Git repository is a daily business task and everybody has done it a few times.
    Examples from real life may be directories for cache, logs, build artifacts, etc.
    There are two different ways to achieve this: creating a `.gitignore` with specific content or creating
    an empty file, usually `.gitkeep`, in the directory. I will explain why the latter approach is better.

---

Creating empty directories in a Git repository is a daily business task, and everybody has done it a few times.
Examples from real life may be directories for cache, logs, build artifacts, etc.
There are two different ways to achieve this: creating a `.gitignore` with specific content or creating
an empty file, usually `.gitkeep`, in the directory. I will explain why the latter approach is better.

The first approach is to create a `.gitignore` file with the following content:

```
*
!.gitignore
```

According to the [documentation](https://git-scm.com/docs/gitignore), Git will process `.gitignore` files moving from the root level to nested directories and overriding rules that coincide.
In other words, the lowest `.gitignore` file in the directory will always win.

The downside of having a few `.gitignore` files in the project is that it gets harder to fetch the full list of empty directories.
This may be especially a problem for the people who just started working on the project and don't know the codebase well enough.

I find the approach of creating a `.gitkeep` file to be more useful.
This approach allows having exactly one `.gitignore` file in the project, with as many empty directories as needed.

There is one additional line that includes `.gitkeep` files everywhere:

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

Pay attention to the `*` at the end – this will affect only files inside the directory, but not the directory itself.
The trick is that `*` does not cover so-called dotfiles, so it ignores `.gitkeep`.
